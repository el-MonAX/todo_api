# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '~> 1.2'
gem 'coffee-rails'
gem 'devise', '~> 4.4'
gem 'devise_token_auth', '~> 0.1.43'
gem 'figaro', '~> 1.1'
gem 'file_validators', '~> 2.1.0'
gem 'fog-aws', '~> 1.4'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2'
gem 'sass-rails', '~> 5.0.7'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'ffaker', '~> 2.8', '>= 2.8.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry', '~> 0.11.3'
  gem 'rspec-rails', '~> 3.7'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
