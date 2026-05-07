source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "acts-as-taggable-array-on"
gem "aws-sdk-s3", require: false
gem "barnes"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "bootstrap"
gem "font_awesome5_rails"
gem "jbuilder"
gem "paper_trail"
gem "pg"
gem "puma"
gem "pundit"
gem "rails", "~> 7.2"
gem "sassc-rails"
gem "sprockets-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "simplecov"
  gem "webdrivers"
end
