# frozen_string_literal: true

source 'https://rubygems.org'

gem 'haml', '5.0.1'
gem 'puma'
gem 'rack-flash3'
gem 'rake'
gem 'require_all'
gem 'sequel', '4.46.0'
gem 'shotgun'
gem 'sinatra', github: 'sinatra/sinatra'
gem 'sqlite3', '1.3.13'
gem 'warden'
gem 'interactor', '~> 3.0'
gem 'foreman'
gem 'bunny'

group :test do
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'rack-test', require: 'rack/test'
  gem 'rspec', '3.6'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'pry'
end
