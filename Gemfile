source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Gem for user authentication
gem 'devise'
# Gem for billing
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
# Environment variable management
gem 'dotenv-rails', :github => "bkeepers/dotenv"
# To prevent brute force login attempts
gem 'rack-attack'
# To connect to the Mindbody API
gem 'mindbody-api', :git => 'https://github.com/jordanhudgens/mindbody-api.git'
# To integrate pagination
gem 'will_paginate', '~> 3.0.7'
# Foundation
gem 'foundation-rails', '= 5.5.1.0'
# Updated server
gem 'thin'
gem 'rails_stdout_logging'
gem 'rails_serve_static_assets'
gem 'rails_12factor', group: :production
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Testing framework
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'cucumber'
  # DB fixtures
  gem 'factory_girl_rails'
  # Cleanups database after transactions
  gem 'database_cleaner'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Checks ruby code grammar
  gem 'rubocop', require: false
  # With rspec
  gem 'rubocop-rspec'
  # With guard
  gem 'guard-rubocop'
  #gem for fake data
  gem 'faker'
  #Autotracking changes for running tests
  gem 'guard'
  gem 'guard-rspec', require: false
  # And updates gems when needed
  gem 'guard-bundler', require: false
  # And auto starts rails server
  gem 'guard-rails'
  # And auto runs migrations
  gem 'guard-migrate'
  gem 'guard-livereload', require: false
end

# For pinging and performance management
gem 'newrelic_rpm'

# App signal library for error management
gem 'appsignal'

# Font Awesome for icons -P
gem "font-awesome-rails"

group :development do
  gem 'bugherd', '~> 0.0.4'
  gem 'capistrano3-puma'
end

gem 'puma'

gem 'sprockets', '~> 2.8'

gem 'ckeditor'

gem 'carrierwave'
gem 'mini_magick'
gem 'capistrano', '~> 3.4.0'
gem 'capistrano-ssh-doctor', '~> 1.0'
gem 'capistrano-rvm'
#gem 'capistrano-rails',   require: false
gem 'capistrano-rails', '~> 1.1'
gem 'capistrano-bundler', require: false
