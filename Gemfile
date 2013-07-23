source 'https://rubygems.org'
gem 'rails', '3.2.13'

# Universal Gems
# ==============

# DB and ORM
# --------------
gem "pg", "~> 0.15.1"
gem "strong_parameters", "~> 0.2.1"

# Authorization Logic
# --------------
gem "cancan", "~> 1.6.10"
gem "rolify"

# Data Sanitation
# --------------
gem "loofah"
gem "loofah-activerecord"
gem "strip_attributes", "~> 1.2"

# API
# --------------
gem "active_model_serializers", "~> 0.8.1"

# File IO 
# --------------
gem "carrierwave"
gem "mini_magick"

# helper gems
# --------------
gem "simple_form", "~> 2.1.0"
gem "figaro", ">= 0.6.4"
gem 'high_voltage'
gem 'rdiscount'

# gem-wrapped assets
# --------------
gem "font-awesome-rails"
gem "ckeditor"
gem "jquery-rails"
gem 'jquery-ui-rails'
# gem 'backbone-nested-attributes'

gem 'newrelic_rpm'

group :development do
	gem "better_errors", ">= 0.8.0"
	gem "binding_of_caller", ">= 0.6.9"
	gem 'quiet_assets'
	# use this when you need new seed data. Commented out for safety
	# gem "seed_dumper"
end

group :development, :test do
	gem "rspec-rails", "~> 2.13.0"
	gem "fabrication", "~> 2.7.0"
	gem "jasmine"
end

# Gems used only for assets and not required in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.6'
 	gem 'coffee-rails'
	gem 'uglifier', '~> 2.1.0'
	gem 'compass-rails'
end

group :test do
	gem "database_cleaner", "~> 1.0.1"
	gem "email_spec", ">= 1.4.0"
	gem "capybara", "~> 2.1.0"
	gem "launchy"
	gem "guard-rspec"
	gem "faker"
	gem "sqlite3"
	gem "poltergeist"
	gem "shoulda-matchers"
	gem "rack_session_access"
end

# Deploy with Capistrano
# gem 'capistrano'

group :production do
	gem "unicorn", "~> 4.6.2"
	# or use puma instead
	# gem "puma"
end
