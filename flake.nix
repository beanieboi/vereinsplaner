{
  description = "Vereinsplaner, a Rails application built with Nix for the runtime";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAll = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      # The runtime (ADR 0006, 0007) starts the one executable in $out/bin as a
      # hardened service: $PORT to listen on, $STATE_DIR for the SQLite database,
      # secrets (RAILS_MASTER_KEY) from the environment, logs on stdout.
      packages = forAll (
        pkgs:
        let
          ruby = pkgs.ruby_4_0;

          lib = pkgs.lib;
          rubyVersion = lib.trim (builtins.readFile ./.ruby-version);

          # Gems come from gemset.nix (regenerate with `nix run nixpkgs#bundix`
          # after changing Gemfile.lock). Native gems are built for the "ruby"
          # platform, so Bundler must not look for the precompiled variants.
          # Bundler reads the Gemfile from the store, where .ruby-version is not
          # next to it, so the requirement is inlined.
          gems =
            assert lib.assertMsg (rubyVersion == toString ruby.version)
              ".ruby-version says ${rubyVersion} but nixpkgs provides Ruby ${ruby.version}; update one of them";
            pkgs.bundlerEnv {
              name = "vereinsplaner-gems";
              inherit ruby;
              gemfile = pkgs.writeText "Gemfile" (
                builtins.replaceStrings [ ''ruby file: ".ruby-version"'' ] [ ''ruby "${rubyVersion}"'' ] (
                  builtins.readFile ./Gemfile
                )
              );
              lockfile = ./Gemfile.lock;
              gemset = ./gemset.nix;
              groups = [
                "default"
                "production"
              ];
            };

          app = pkgs.stdenvNoCC.mkDerivation {
            pname = "vereinsplaner";
            version = "0.1.0";
            src = self;

            nativeBuildInputs = [
              gems
              gems.wrappedRuby
            ];

            env = {
              RAILS_ENV = "production";
              BUNDLE_FORCE_RUBY_PLATFORM = "1";
              BUNDLE_WITHOUT = "development:test";
              SECRET_KEY_BASE_DUMMY = "1";
            };

            buildPhase = ''
              runHook preBuild
              export HOME=$TMPDIR BOOTSNAP_CACHE_DIR=$TMPDIR/bootsnap
              ruby bin/rails assets:precompile
              rm -rf tmp log .github .ruby-lsp docs test coverage
              runHook postBuild
            '';

            installPhase = ''
              runHook preInstall
              mkdir -p $out/share $out/bin
              cp -r . $out/share/vereinsplaner
              substituteAll ${./bin/runtime-start} $out/bin/vereinsplaner
              chmod +x $out/bin/vereinsplaner
              runHook postInstall
            '';

            # substituteAll fills these into bin/runtime-start.
            appdir = placeholder "out" + "/share/vereinsplaner";
            wrappedRuby = gems.wrappedRuby;
          };
        in
        {
          default = app;
          inherit gems;
        }
      );

      devShells = forAll (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.ruby_4_0
            pkgs.bundix
            pkgs.sqlite
          ];
        };
      });
    };
}
