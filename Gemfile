# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "aws-sdk-s3", require: false
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "bootstrap"
gem "font_awesome5_rails"
gem "jbuilder"
gem "paper_trail"
gem "puma"
gem "pundit"
gem "rails", "~> 8.1"
gem "sassc-rails"
gem "sqlite3"
gem "sprockets-rails"

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "simplecov"
end
