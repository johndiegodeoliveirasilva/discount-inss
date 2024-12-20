# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
# Use pg as the database for Active Record
gem 'pg', '~> 1.5', '>= 1.5.9'

gem 'chart-js-rails'
gem 'cocoon'

# Loads environment variables from `.env`.
gem 'dotenv', '~> 2.8', '>= 2.8.1'

# The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web. http://getbootstrap.com
gem 'bootstrap', '~> 5.3', '>= 5.3.3'

# Simple, efficient background processing for Ruby.
gem 'sidekiq', '~> 6.5', '>= 6.5.12'

# This gem provides jQuery and the jQuery-ujs driver for your Rails 4+ application.
gem 'jquery-rails', '~> 4.6'

# Works with Rails out of the box.
gem 'popper_js', '~> 2.11', '>= 2.11.8'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Ransack is the successor to the MetaSearch gem. It improves and expands upon MetaSearch's functionality,
# but does not have a 100%-compatible API.
gem 'ransack', '~> 2.3'

# Toastr: Simple javascript toast notifications, plugged into the rails asset pipeline.
gem 'toastr-rails', '~> 1.0', '>= 1.0.3'

# Integrate SassC-Ruby into Rails.
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'rubocop', '~> 1.33'

# Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 4+
gem 'kaminari', '~> 1.2', '>= 1.2.2'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Ruby FFI library
gem 'ffi', '~> 1.17'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 2.18', '>= 2.18.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.3'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  # Simple testing of Sidekiq jobs via a collection of matchers and helpers
  gem 'rspec-sidekiq', '~> 4.0', '>= 4.0.2'
  # rspec-rails integrates the Rails testing helpers into RSpec.
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  # Strategies for cleaning databases using ActiveRecord. Can be used to ensure a clean state for testing.
  gem 'database_cleaner-active_record', '~> 2.2'
  gem 'factory_bot_rails', '~> 5.2'
  gem 'rails-controller-testing'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'devise', '~> 4.9'
