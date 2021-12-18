source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '< 7'
gem 'pg'
gem 'puma'
gem 'barnes'

gem 'acts-as-taggable-array-on'
gem "aws-sdk-s3", require: false
gem 'paper_trail'
gem 'rails_admin'

gem 'pundit' # Authorization Library https://github.com/elabs/pundit

gem 'sassc-rails'
gem 'sprockets-rails'
gem 'bootstrap', "< 5"
gem 'webpacker'
gem 'font_awesome5_rails'

gem 'jbuilder'
gem 'bcrypt'

gem 'honeycomb-beeline'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  gem 'web-console'
  gem 'listen'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov'
end
