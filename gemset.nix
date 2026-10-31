{
  action_text-trix = {
    dependencies = ["railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02a0yz97d12cf6wcj5r43ak57mhlcj4r84k5ma2g570046aga4kh";
      type = "gem";
    };
    version = "2.1.19";
  };
  actioncable = {
    dependencies = ["actionpack" "activesupport" "nio4r" "websocket-driver" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04bzm9z05dllly0yy6jpgkmd0vmdqpc2lxvdr76irq31r3w75kfg";
      type = "gem";
    };
    version = "8.1.4";
  };
  actionmailbox = {
    dependencies = ["actionpack" "activejob" "activerecord" "activestorage" "activesupport" "mail"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sq679wp7f18bc88svhfdbjn8kv3ia5sfglgap773dpbfzjjaicw";
      type = "gem";
    };
    version = "8.1.4";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "activesupport" "mail" "rails-dom-testing"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14zhp9s8cmb7scmhxmanir7syrljcdik6792iyinxr1afvb9abgq";
      type = "gem";
    };
    version = "8.1.4";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "nokogiri" "rack" "rack-session" "rack-test" "rails-dom-testing" "rails-html-sanitizer" "useragent"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "190fwdv8rx9ixr9y020szwr5nzpsh141iz768mv5l6dya7696m14";
      type = "gem";
    };
    version = "8.1.4";
  };
  actiontext = {
    dependencies = ["action_text-trix" "actionpack" "activerecord" "activestorage" "activesupport" "globalid" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i7nvd06ydm5x4h0pch1m9ifrqd82dqb363xzh8zjsnslyz9kvik";
      type = "gem";
    };
    version = "8.1.4";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xk0487vhlkklcfcj973nnxgsryb7d12ncl8sax9m5jdgk8fzwgg";
      type = "gem";
    };
    version = "8.1.4";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16a0h9wc6nmf7k3wiq7fhi42l83g6kwgxv4vy3swiiacipnv5maf";
      type = "gem";
    };
    version = "8.1.4";
  };
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1s50ww57lm2qysr2vryfvj1xll7pp09dnmv1y2jql4dx4z0hc2cs";
      type = "gem";
    };
    version = "8.1.4";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "timeout"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kxh03zk69y5nrvpky5a068kmh7a2a9r1akzplqr4v14gzm5fj9v";
      type = "gem";
    };
    version = "8.1.4";
  };
  activestorage = {
    dependencies = ["actionpack" "activejob" "activerecord" "activesupport" "marcel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1a67hni2l39ig4i91k7laqmzh9xngj3prd9jnghfaqzfr4z6z5gl";
      type = "gem";
    };
    version = "8.1.4";
  };
  activesupport = {
    dependencies = ["base64" "bigdecimal" "concurrent-ruby" "connection_pool" "drb" "i18n" "json" "logger" "minitest" "securerandom" "tzinfo" "uri"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pw09rmd9f9x0i0ai11ajcf6c7xvi48pn8sbjf8q7z648gzd67c9";
      type = "gem";
    };
    version = "8.1.4";
  };
  ast = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10yknjyn0728gjn6b5syynvrvrwm66bhssbxq8mkhshxghaiailm";
      type = "gem";
    };
    version = "2.4.3";
  };
  aws-eventstream = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15nf544xhbhxgm4d38479yifqjspa41ysjp58h1v0jyzc6fakdnf";
      type = "gem";
    };
    version = "1.4.1";
  };
  aws-partitions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sgwixw8bghn4ilpyr09rix1xsaakckpj6mq7hs5fnjh3zsrr2ny";
      type = "gem";
    };
    version = "1.1299.0";
  };
  aws-sdk-core = {
    dependencies = ["aws-eventstream" "aws-partitions" "aws-sigv4" "base64" "bigdecimal" "jmespath" "logger" "rexml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dpasbfbq8c855krni6hk3wkc56nx6inw7cf8l9i339p06krjm6v";
      type = "gem";
    };
    version = "3.261.0";
  };
  aws-sdk-kms = {
    dependencies = ["aws-sdk-core" "aws-sigv4"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19d5gndqxldv4w1ga04cd5rdzbxq212vsnnfigans6a1dky5f4n6";
      type = "gem";
    };
    version = "1.136.0";
  };
  aws-sdk-s3 = {
    dependencies = ["aws-sdk-core" "aws-sdk-kms" "aws-sigv4"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q2nprar51kn7x2099jswcs2dc0byabpw9ljgl5zw540w571sb74";
      type = "gem";
    };
    version = "1.235.0";
  };
  aws-sigv4 = {
    dependencies = ["aws-eventstream"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "003ch8qzh3mppsxch83ns0jra8d222ahxs96p9cdrl0grfazywv9";
      type = "gem";
    };
    version = "1.12.1";
  };
  base64 = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yx9yn47a8lkfcjmigk79fykxvr80r4m1i35q82sxzynpbm7lcr7";
      type = "gem";
    };
    version = "0.3.0";
  };
  bcrypt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0clhya4p8lhjj7hp31inp321wgzb0b5wbwppmya5sw1dikl7400z";
      type = "gem";
    };
    version = "3.1.22";
  };
  bigdecimal = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rng45p4vc3f6nac44cnylwch7rj4zsff3icdz6c7garwpjy3sv1";
      type = "gem";
    };
    version = "4.1.3";
  };
  bindex = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zmirr3m02p52bzq4xgksq4pn8j641rx5d4czk68pv9rqnfwq7kv";
      type = "gem";
    };
    version = "0.8.1";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06xz31vjlw3drpl27csk8q9ymi8ay0f85mb356h79kg62mq275na";
      type = "gem";
    };
    version = "1.26.0";
  };
  bootstrap = {
    dependencies = ["popper_js"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bvlcj245bbbgw4dfly4lp0d4q72jgda145db008mhjfy9nv08qw";
      type = "gem";
    };
    version = "5.3.8";
  };
  brakeman = {
    dependencies = ["racc"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01vyq7yn1g5psz4fm67y4l25sv3yi97scjf89cpq89a99qhybafg";
      type = "gem";
    };
    version = "8.1.0";
  };
  builder = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pw3r2lyagsxkm71bf44v5b74f7l9r7di22brbyji9fwz791hya9";
      type = "gem";
    };
    version = "3.3.0";
  };
  bundler-audit = {
    dependencies = ["thor"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sdlr4rj7x5nbrl8zkd3dqdg4fc50bnpx37rl0l0szg4f5n7dj41";
      type = "gem";
    };
    version = "0.9.3";
  };
  concurrent-ruby = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qfi2ns3zwkgq616fc127xiqhan7g7m7gqpwriwcr34nds1vxwdj";
      type = "gem";
    };
    version = "1.3.8";
  };
  connection_pool = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02ifws3c4x7b54fv17sm4cca18d2pfw1saxpdji2lbd1f6xgbzrk";
      type = "gem";
    };
    version = "3.0.2";
  };
  crass = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zjfw8xs3zlqaa07s4m500x84i6437l9r9mk4dwqx7y5lb3la0bs";
      type = "gem";
    };
    version = "1.0.8";
  };
  date = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "105m4y6iwannk0vmn43px6rh8mlczp1bispq6hsxksr49rf99b0q";
      type = "gem";
    };
    version = "3.6.0";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = ["development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1djjx5332d1hdh9s782dyr0f9d4fr9rllzdcz2k0f8lz2730l2rf";
      type = "gem";
    };
    version = "1.11.1";
  };
  drb = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wrkl7yiix268s2md1h6wh91311w95ikd8fy8m5gx589npyxc00b";
      type = "gem";
    };
    version = "2.2.3";
  };
  erb = {
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14pfj6zn0p1hxj6s6s0r7d424wap8zl9zxf89nj79y8fbg16vjn5";
      type = "gem";
    };
    version = "6.0.7";
  };
  erubi = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1naaxsqkv5b3vklab5sbb9sdpszrjzlfsbqpy7ncbnw510xi10m0";
      type = "gem";
    };
    version = "1.13.1";
  };
  ffi = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kqasqvy8d7r09ri4n6bkdwbk63j7afd9ilsw34nzlgh0qp69ldw";
      type = "gem";
    };
    version = "1.17.4";
  };
  font_awesome5_rails = {
    dependencies = ["nokogiri" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1llzgygb5zpc2canvpd6ldyrfdigbhzsbsq0n72n8zgckf9bwnd1";
      type = "gem";
    };
    version = "1.5.0";
  };
  globalid = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09zl0rkskfq0cwfrk9ypjvflvzanfg3xbhh1slaa1myry7xi4zq3";
      type = "gem";
    };
    version = "1.4.0";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dfikmmd9dllirsfq0kjiyxpmlq0afkxm5sslsr97r9g85ifpy80";
      type = "gem";
    };
    version = "1.15.2";
  };
  io-console = {
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cgvhm0d4awr8j42b8v1nl1jfgx45ihv8mylargfi3lj697k00x4";
      type = "gem";
    };
    version = "0.9.4";
  };
  irb = {
    dependencies = ["pp" "prism" "rdoc" "reline"];
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qs8a9vprg7s8krgq4s0pygr91hclqqyz98ik15p0m1sf2h5956y";
      type = "gem";
    };
    version = "1.18.0";
  };
  jbuilder = {
    dependencies = ["actionview" "activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dvn8m8lnah6id60r0fb7hq3rg6qz6f01cbmb35vmkmhiz1bwc14";
      type = "gem";
    };
    version = "2.15.1";
  };
  jmespath = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cdw9vw2qly7q7r41s7phnac264rbsdqgj4l0h4nqgbjb157g393";
      type = "gem";
    };
    version = "1.6.2";
  };
  json = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0shwgjqbj856mb6m9kgkpy08nhym2gdvc2yaprlimfmky9y3n78z";
      type = "gem";
    };
    version = "2.21.2";
  };
  language_server-protocol = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k0311vah76kg5m6zr7wmkwyk5p2f9d9hyckjpn3xgr83ajkj7px";
      type = "gem";
    };
    version = "3.17.0.5";
  };
  lint_roller = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11yc0d84hsnlvx8cpk4cbj6a4dz9pk0r1k29p0n1fz9acddq831c";
      type = "gem";
    };
    version = "1.1.0";
  };
  logger = {
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00q2zznygpbls8asz5knjvvj2brr3ghmqxgr83xnrdj4rk3xwvhr";
      type = "gem";
    };
    version = "1.7.0";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "062r891hxis58j5q735kk9sj5srxx0rv813f8m95bilsjm3gf1r0";
      type = "gem";
    };
    version = "2.25.2";
  };
  mail = {
    dependencies = ["logger" "mini_mime" "net-imap" "net-pop" "net-smtp"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1s30l5z7jkazgi4m6l6mh80rgsyhh2pp1pa5h70xclsj8z54wmq6";
      type = "gem";
    };
    version = "2.9.1";
  };
  marcel = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17w53z6vka8ddmxvi936biqv443d5yg0503wj7xfmy9j1qvfjy0n";
      type = "gem";
    };
    version = "1.2.1";
  };
  mini_mime = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vycif7pjzkr29mfk4dlqv3disc5dn0va04lkwajlpr1wkibg0c6";
      type = "gem";
    };
    version = "1.1.5";
  };
  mini_portile2 = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12f2830x7pq3kj0v8nz0zjvaw02sv01bqs1zwdrc04704kwcgmqc";
      type = "gem";
    };
    version = "2.8.9";
  };
  minitest = {
    dependencies = ["drb" "prism"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wfnqyfayx9n9j7x871v2ars4hjhfisi1dl24fa64ylq3mns6ghm";
      type = "gem";
    };
    version = "6.0.6";
  };
  msgpack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yry1bcnbl0c5xwg173n5y647596r8ydmsppa01c5l8d6lnw44a4";
      type = "gem";
    };
    version = "1.8.4";
  };
  net-imap = {
    dependencies = ["date" "net-protocol"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q1nq8mx22v9sn1296s45nm6dni42y3m3s1f4pg5dn3mx4xmgjdm";
      type = "gem";
    };
    version = "0.6.7";
  };
  net-pop = {
    dependencies = ["net-protocol"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wyz41jd4zpjn0v1xsf9j778qx1vfrl24yc20cpmph8k42c4x2w4";
      type = "gem";
    };
    version = "0.1.2";
  };
  net-protocol = {
    dependencies = ["timeout"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ly8x39gr23blbmfwfyy14lb2v9kg8bj5x0b2r2llyb4dy60rygr";
      type = "gem";
    };
    version = "0.4.0";
  };
  net-smtp = {
    dependencies = ["net-protocol"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g4gcydr0hza3wiizny0p5q4phl3fkhfsa4r5xir8bbb9p03q41m";
      type = "gem";
    };
    version = "0.5.2";
  };
  nio4r = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18fwy5yqnvgixq3cn0h63lm8jaxsjjxkmj8rhiv8wpzv9271d43c";
      type = "gem";
    };
    version = "2.7.5";
  };
  nokogiri = {
    dependencies = ["mini_portile2" "racc"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d9safb4dly6qmc2g06444l0zifby52yy6j1a5fa1g4j3ihm3jah";
      type = "gem";
    };
    version = "1.19.4";
  };
  paper_trail = {
    dependencies = ["activerecord" "request_store"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "118w09wvy4s7jykv5b7j5ac9nkx158g853lh2mqclx1q3l344a0w";
      type = "gem";
    };
    version = "17.0.0";
  };
  parallel = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mlkn1vhh9lr7vljibpgspwsswk7mzm8nw6bbr616c9fbj35hlmk";
      type = "gem";
    };
    version = "2.1.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m2xqvn1la62hji1mn04y59giikww95p2hs0r4y2rrz3mdxcwyni";
      type = "gem";
    };
    version = "3.3.11.1";
  };
  popper_js = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lnvx84yckn33ybwjxhbcj7hx7jsaa45gidv7pdhpmf0gxqvxc7l";
      type = "gem";
    };
    version = "2.11.8";
  };
  pp = {
    dependencies = ["prettyprint"];
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w5mha75hs8gdj75g8vl0sxpyp8rzvwq8a4jcmi4ah8cf370zjyz";
      type = "gem";
    };
    version = "0.6.4";
  };
  prettyprint = {
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1m5pqkp8rdk0bkxxz3bp3vn8pn3bd9a97dkl8wfh1kyplrzdamfm";
      type = "gem";
    };
    version = "0.2.1";
  };
  prism = {
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11ggfikcs1lv17nhmhqyyp6z8nq5pkfcj6a904047hljkxm0qlvv";
      type = "gem";
    };
    version = "1.9.0";
  };
  puma = {
    dependencies = ["nio4r"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yw6nvkvddriacmva8hm0za0961d6j96dm7zm6748rmyzcfqgvf8";
      type = "gem";
    };
    version = "8.0.2";
  };
  pundit = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gcb23749jwggmgic4607ky6hm2c9fpkya980iihpy94m8miax73";
      type = "gem";
    };
    version = "2.5.2";
  };
  racc = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0byn0c9nkahsl93y9ln5bysq4j31q8xkf2ws42swighxd4lnjzsa";
      type = "gem";
    };
    version = "1.8.1";
  };
  rack = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dwgab330lsv4qppw3f52mc4ihr8lagxgll53mkmcdgr4hf3xqck";
      type = "gem";
    };
    version = "3.2.7";
  };
  rack-session = {
    dependencies = ["base64" "rack"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1s7zcxlmg88a6dam4aqbgk9xkpy6dkdfqmmcszkkliy3q3w38m2r";
      type = "gem";
    };
    version = "2.1.2";
  };
  rack-test = {
    dependencies = ["rack"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qy4ylhcfdn65a5mz2hly7g9vl0g13p5a0rmm6sc0sih5ilkcnh0";
      type = "gem";
    };
    version = "2.2.0";
  };
  rackup = {
    dependencies = ["rack"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s48d2a0z5f0cg4npvzznf933vipi6j7gmk16yc913kpadkw4ybc";
      type = "gem";
    };
    version = "2.3.1";
  };
  rails = {
    dependencies = ["actioncable" "actionmailbox" "actionmailer" "actionpack" "actiontext" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fx325cnd3p5s23iyqz5fr6jixq09avf7zmq64p9pdx3lbwwsgjz";
      type = "gem";
    };
    version = "8.1.4";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "minitest" "nokogiri"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07awj8bp7jib54d0khqw391ryw8nphvqgw4bb12cl4drlx9pkk4a";
      type = "gem";
    };
    version = "2.3.0";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah" "nokogiri"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hi25xz5ijz3kjx4vsiywqbq05mlkas7di8pwc3p6mhyn34sg5z7";
      type = "gem";
    };
    version = "1.7.1";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "irb" "rackup" "rake" "thor" "tsort" "zeitwerk"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g2qzxzxkykghafprg82dhgaw2lnf5wj4qmgd16i2csfk3lairxm";
      type = "gem";
    };
    version = "8.1.4";
  };
  rainbow = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "009p524zl0p0kfa65nii8wdmaigkmawv9pbvlcffky7islmmp0nb";
      type = "gem";
    };
    version = "13.4.2";
  };
  rbs = {
    dependencies = ["logger" "prism" "tsort"];
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0x067q8cdam4kv5dc09iq2nzca8qm2kdl0dr22gc0ny0vj3bixsi";
      type = "gem";
    };
    version = "4.2.0";
  };
  rdoc = {
    dependencies = ["erb" "prism" "rbs" "tsort"];
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02pn63i2r5z44hcfhxbaag9rvqsyznsliivnn7f3dzaw1a43gz5y";
      type = "gem";
    };
    version = "8.1.0";
  };
  regexp_parser = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fwfw26a32rps78920nn29shqg2zmqv72i89j1fap41isshida9m";
      type = "gem";
    };
    version = "2.12.0";
  };
  reline = {
    dependencies = ["io-console"];
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gaq2lc463ap1srz7y5kh2p4dxazs7vjrpiby58d9yfvan72s0av";
      type = "gem";
    };
    version = "0.7.0";
  };
  request_store = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jw89j9s5p5cq2k7ffj5p4av4j4fxwvwjs1a4i9g85d38r9mvdz1";
      type = "gem";
    };
    version = "1.7.0";
  };
  rexml = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hninnbvqd2pn40h863lbrn9p11gvdxp928izkag5ysx8b1s5q0r";
      type = "gem";
    };
    version = "3.4.4";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "lint_roller" "parallel" "parser" "rainbow" "regexp_parser" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ca5inh368d4l24a2v2nbd3p4xc6s0pqs91j27h226nh04zmyha4";
      type = "gem";
    };
    version = "1.86.1";
  };
  rubocop-ast = {
    dependencies = ["parser" "prism"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dahfpnzz63hyqxa03x8rypnrxzwyvh4i5a8ri34bzpnf3pg64j4";
      type = "gem";
    };
    version = "1.49.1";
  };
  rubocop-performance = {
    dependencies = ["lint_roller" "rubocop" "rubocop-ast"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0d0qyyw1332afi9glwfjkb4bd62gzlibar6j55cghv8rzwvbj6fd";
      type = "gem";
    };
    version = "1.26.1";
  };
  rubocop-rails = {
    dependencies = ["activesupport" "lint_roller" "rack" "rubocop" "rubocop-ast"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1llsxc8wm2pq8glpv5mczd1h36fazbri3wwrh7dfqra80a4pklqh";
      type = "gem";
    };
    version = "2.34.3";
  };
  rubocop-rails-omakase = {
    dependencies = ["rubocop" "rubocop-performance" "rubocop-rails"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "178h17q6wfsxk8gzqk1ca6dw25cwmwc2dgdb34lxwljqxv43mxra";
      type = "gem";
    };
    version = "1.1.0";
  };
  ruby-progressbar = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      type = "gem";
    };
    version = "1.13.0";
  };
  sassc = {
    dependencies = ["ffi"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gpqv48xhl8mb8qqhcifcp0pixn206a7imc07g48armklfqa4q2c";
      type = "gem";
    };
    version = "2.4.0";
  };
  sassc-rails = {
    dependencies = ["railties" "sassc" "sprockets" "sprockets-rails" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d9djmwn36a5m8a83bpycs48g8kh1n2xkyvghn7dr6zwh4wdyksz";
      type = "gem";
    };
    version = "2.1.2";
  };
  securerandom = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cd0iriqfsf1z91qg271sm88xjnfd92b832z49p1nd542ka96lfc";
      type = "gem";
    };
    version = "0.4.1";
  };
  simplecov = {
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "118fdpg7h1ny1fz6kmiyz6gccvwmb23h6bhsi1hdpf7ib4byq8ia";
      type = "gem";
    };
    version = "1.3.2";
  };
  sprockets = {
    dependencies = ["concurrent-ruby" "logger" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1car3fpzhn1l06x2zmanz2l4bj346mv3jcgpcd3p1262y54ml7kn";
      type = "gem";
    };
    version = "4.2.2";
  };
  sprockets-rails = {
    dependencies = ["actionpack" "activesupport" "sprockets"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17hiqkdpcjyyhlm997mgdcr45v35j5802m5a979i5jgqx5n8xs59";
      type = "gem";
    };
    version = "3.5.2";
  };
  sqlite3 = {
    dependencies = ["mini_portile2"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x1zn43vs6g07ggpiv7h0qb89fyvs8kbsbadyhn8hrmpyn8jrrbs";
      type = "gem";
    };
    version = "2.10.1";
  };
  thor = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wsy88vg2mazl039392hqrcwvs5nb9kq8jhhrrclir2px1gybag3";
      type = "gem";
    };
    version = "1.5.0";
  };
  tilt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cvaikq1dcbfl008i16c1pi1gmdax7vfkvmhch64jdkakyk9nnqd";
      type = "gem";
    };
    version = "2.7.0";
  };
  timeout = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jxcji88mh6xsqz0mfzwnxczpg7cyniph7wpavnavfz7lxl77xbq";
      type = "gem";
    };
    version = "0.6.1";
  };
  tsort = {
    groups = ["default" "development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17q8h020dw73wjmql50lqw5ddsngg67jfw8ncjv476l5ys9sfl4n";
      type = "gem";
    };
    version = "0.2.0";
  };
  tzinfo = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16w2g84dzaf3z13gxyzlzbf748kylk5bdgg3n1ipvkvvqy685bwd";
      type = "gem";
    };
    version = "2.0.6";
  };
  unicode-display_width = {
    dependencies = ["unicode-emoji"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hiwhnqpq271xqari6mg996fgjps42sffm9cpk6ljn8sd2srdp8c";
      type = "gem";
    };
    version = "3.2.0";
  };
  unicode-emoji = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03zqn207zypycbz5m9mn7ym763wgpk7hcqbkpx02wrbm1wank7ji";
      type = "gem";
    };
    version = "4.2.0";
  };
  uri = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yv9n69g99wldlx04q3my61jy5cf75z5xvd0n1465vxvxac2wac9";
      type = "gem";
    };
    version = "1.1.2";
  };
  useragent = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i1q2xdjam4d7gwwc35lfnz0wyyzvnca0zslcfxm9fabml9n83kh";
      type = "gem";
    };
    version = "0.16.11";
  };
  web-console = {
    dependencies = ["actionview" "bindex" "railties"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "193ddancfznc34qp2bqz5mkv906v4aka6njv2lzhkhnz3hq72fz1";
      type = "gem";
    };
    version = "4.3.0";
  };
  websocket-driver = {
    dependencies = ["base64" "websocket-extensions"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ij19k6034x0c4hw0ywa7wnk5s912r8aq0hhjss10d5z36q5dicp";
      type = "gem";
    };
    version = "0.8.2";
  };
  websocket-extensions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hc2g9qps8lmhibl5baa91b4qx8wqw872rgwagml78ydj8qacsqw";
      type = "gem";
    };
    version = "0.1.5";
  };
  zeitwerk = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rcjpgyzmdxp8rdw466156fmr588k9q1wg8j42g0dkk7hid1519c";
      type = "gem";
    };
    version = "2.8.3";
  };
}
