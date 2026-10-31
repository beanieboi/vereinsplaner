# Installation

This guide covers running Vereinsplaner locally for development and deploying it to production with Docker.

## Prerequisites

- Ruby 4.0.7 (see `.ruby-version`; `.tool-versions` works with asdf or mise)
- Bundler
- SQLite 3
- libvips, needed by Active Storage for image variants
- Git

On macOS with Homebrew:

```sh
brew install sqlite vips
```

On Debian or Ubuntu:

```sh
sudo apt-get install build-essential git libsqlite3-dev libvips libyaml-dev pkg-config
```

## Local development

1. Clone the repository and change into it:

   ```sh
   git clone https://github.com/beanieboi/vereinsplaner.git
   cd vereinsplaner
   ```

2. Run the setup script. It installs gems, creates and migrates `db/development.sqlite3`, clears old logs and starts the server:

   ```sh
   bin/setup
   ```

   Use `bin/setup --skip-server` to only prepare the environment, or `bin/setup --reset` to drop and recreate the database.

3. Load the membership types. The app expects them to exist before you create members:

   ```sh
   bin/rails db:seed
   ```

4. Create the first user. There is no sign-up page, so create an admin from the Rails console:

   ```sh
   bin/rails console
   ```

   ```ruby
   User.create!(nickname: "admin", email: "admin@example.com", password: "change-me", admin: true)
   ```

5. Open http://localhost:3000 and sign in with that email and password. Further users can be created in the admin area.

Uploaded application forms are stored on local disk under `storage/` in development and under `tmp/storage/` in tests.

### Running checks

```sh
bin/rails test   # test suite
bin/rubocop      # style
bin/brakeman     # static security analysis
bin/bundler-audit
bin/ci           # all of the above, same as the GitHub Actions workflow
```

## Production on the runtime

Production runs on the runtime (the `apps` VM behind `deploy.abwesend.com`). Every push to `main` runs `.github/workflows/deploy.yaml`, which builds the Nix flake's default package and posts the closure to the runtime with the job's OIDC token. The repository variable `RUNTIME_DEPLOY_URL` holds the deploy URL.

What the flake builds (`flake.nix`):

- Gems from `gemset.nix`, produced by bundix from `Gemfile.lock`. After changing `Gemfile.lock`, regenerate it with `nix run nixpkgs#bundix` and commit it. Native gems are compiled for the `ruby` platform, which is why the lockfile also lists the `ruby` platform and the build sets `BUNDLE_FORCE_RUBY_PLATFORM`.
- Precompiled assets, inside the store path. Nothing under the application directory is writable at run time, which is why production caches in memory.
- One executable, `bin/vereinsplaner`, generated from `bin/runtime-start`. It prepares the SQLite database at `$STATE_DIR/production.sqlite` and starts Puma on `127.0.0.1:$PORT`.

Check the build locally with `nix build` (and on `builder` for x86_64-linux) before pushing. The Ruby version in `.ruby-version` must match `ruby_4_0` in the pinned nixpkgs; the flake fails with a clear message otherwise.

Operator settings on the VM (see [self-hosted-sqlite-runbook.md](self-hosted-sqlite-runbook.md)):

| Setting | Value |
| --- | --- |
| Secret `RAILS_MASTER_KEY` | `ssh apps runtime env set vereinsplaner --stdin`, from `config/master.key` |
| Memory limit | 512 MiB (`runtime limits set vereinsplaner --memory 512`); Puma runs one worker with 3 threads at about 130 MB RSS |
| Hostname | `verein.tfc-leipzig.com`, routed by Caddy on bouncer to `apps.internal:80` |

## Production with Docker

The `Dockerfile` builds a production image that runs Puma on port 80 as a non-root user. The entrypoint runs `rails db:prepare` on start, so migrations are applied automatically.

### Required configuration

| Setting | Purpose |
| --- | --- |
| `RAILS_MASTER_KEY` | Decrypts `config/credentials.yml.enc`. Take the value from `config/master.key`. |
| Persistent volume at `/rails/storage` | Holds the SQLite database (`storage/production.sqlite`) and locally mirrored uploads. Without it all data is lost when the container is replaced. |
| AWS credentials in Rails credentials | Production mirrors uploads to the S3 bucket `vereinsplaner-production` in `eu-central-1`. Set `aws.access_key_id` and `aws.secret_access_key` with `bin/rails credentials:edit`. |

Run exactly one container per database file. SQLite does not support several app replicas writing to the same file.

### Build and run

```sh
docker build -t vereinsplaner .

docker run -d \
  --name vereinsplaner \
  -p 80:80 \
  -e RAILS_MASTER_KEY=<value from config/master.key> \
  -v vereinsplaner-storage:/rails/storage \
  vereinsplaner
```

Then seed the membership types and create the first admin user inside the running container:

```sh
docker exec -it vereinsplaner bin/rails db:seed
docker exec -it vereinsplaner bin/rails console
```

```ruby
User.create!(nickname: "admin", email: "admin@example.com", password: "change-me", admin: true)
```

The app assumes it runs behind a TLS-terminating reverse proxy (`config.assume_ssl` is enabled). Put it behind Caddy, nginx, Traefik or a platform such as Coolify that handles HTTPS.

### Upgrading

Build a new image, stop the old container and start a new one against the same volume. The entrypoint migrates the database on boot. Take a backup first; see [self-hosted-sqlite-runbook.md](self-hosted-sqlite-runbook.md) for the backup and restore procedure.

## Troubleshooting

- **`ActiveSupport::MessageEncryptor::InvalidMessage` on boot**: `RAILS_MASTER_KEY` does not match `config/credentials.yml.enc`.
- **"Keine Berechtigung" when opening the admin area**: the signed-in user does not have the admin flag. Set it from the console with `User.find_by(email: "...").update!(admin: true)`.
- **Members cannot be created**: the membership types are missing. Run `bin/rails db:seed`.
