source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'acts-as-taggable-array-on'

gem 'pundit' # Authorization Library https://github.com/elabs/pundit

gem 'sass-rails', '~> 5'
gem 'bootstrap', '~> 4.3.1'
gem 'webpacker', '~> 4.0'
gem 'font-awesome-rails'

gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'

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
