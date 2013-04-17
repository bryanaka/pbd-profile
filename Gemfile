source 'https://rubygems.org'
gem 'rails', '3.2.13'

# Universal Gems
gem "jquery-rails"
gem "cancan", ">= 1.6.8"
gem "rolify"
gem "simple_form", ">= 2.0.4"
gem "figaro", ">= 0.5.3"
gem "strong_parameters"
gem "carrierwave"
gem "pg"
gem "ember-rails"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
	gem "better_errors", ">= 0.6.0"
	gem "binding_of_caller", ">= 0.6.9"
end

group :development, :test do
	gem "rspec-rails", ">= 2.12.2"
	gem "fabrication", ">= 2.3.0"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.3'
 	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
	gem 'compass-rails'
end


group :test do
	gem "database_cleaner", ">= 0.9.1"
	gem "email_spec", ">= 1.4.0"
	gem "capybara", ">= 2.0.2"
end

group :production do
	gem "unicorn", ">= 4.3.1"
end
