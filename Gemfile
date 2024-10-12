source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "rails", "~> 7.2.0"
gem "pg"
gem "puma"
gem "barnes"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "acts-as-taggable-array-on"
gem "aws-sdk-s3", require: false
gem "paper_trail"
gem "pundit" # Authorization Library https://github.com/elabs/pundit

# Frontend
gem "sprockets-rails"
gem "sassc-rails"
gem "bootstrap"
gem "font_awesome5_rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "simplecov"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
