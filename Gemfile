source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem 'acts-as-taggable-on', '~> 9.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Better frontend assets for Rails
gem 'vite_rails'

# Auth with Rails
gem "rodauth-rails", "~> 1.0"

# View emails locally
gem 'letter_opener', group: :development

# Queueing and background jobs for Rails
gem "sidekiq"

# Sidekiq dependency
gem "redis"

# Beautiful logging
gem "awesome_print"

# Monitor SQL database
gem "rails_db", ">= 2.3.1"

# Have some env var in a .env file 
gem 'dotenv-rails', groups: [:development, :test]

# Render Markdown
gem 'redcarpet'

# Cypress Rails
gem 'cypress-rails', groups: [:development, :test]

# Allow mock of external requests
gem 'webmock', groups: [:test]

# Ruby Test Coverage
gem 'simplecov', require: false, group: :test

# Authorization
gem "action_policy"

# Enable gzip compression on Heroku
gem 'heroku-deflater', :group => :production

