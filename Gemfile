source 'https://rubygems.org'

gem 'rails', '3.2.13'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'factory_girl_rails', '~> 4.0'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.3.1.0'
  gem 'uglifier', '>= 1.0.3'
  gem 'skeleton-rails'
end

gem 'jquery-rails'


if RUBY_PLATFORM =~ /darwin/
  group :development, :test do
    gem 'rb-fsevent'
  end
end
