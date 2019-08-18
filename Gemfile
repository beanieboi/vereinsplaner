source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'barnes'

gem 'acts-as-taggable-array-on'
gem 'activestorage-database-service', github: 'markaschneider/activestorage-database-service'
gem 'paper_trail'
gem 'rails_admin', '~> 2.0.0'

gem 'pundit' # Authorization Library https://github.com/elabs/pundit

gem 'sass-rails', '~> 5'
gem 'bootstrap', '~> 4.3.1'
gem 'webpacker', '~> 4.0'
gem 'font-awesome-rails'

gem 'jbuilder', '~> 2.5'
gem 'bcrypt'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov'
end
