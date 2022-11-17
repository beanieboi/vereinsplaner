source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "pg"
gem "puma"
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
gem "bootstrap", "< 5"
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
