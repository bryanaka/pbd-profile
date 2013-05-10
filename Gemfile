source 'https://rubygems.org'
gem 'rails', '3.2.13'

# Universal Gems
gem "jquery-rails"
gem "cancan", "~> 1.6.10"
gem "rolify"
gem "simple_form", "~> 2.1.0"
gem "figaro", ">= 0.5.3"
gem "strong_parameters", "~> 0.2.1"
gem "carrierwave"
gem "pg", "~> 0.15.1"
gem "active_model_serializers", "~> 0.8.1"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
	gem "better_errors", ">= 0.8.0"
	gem "binding_of_caller", ">= 0.6.9"
	# use this when you need new seed data
	# gem "seed_dumper"
end

group :development, :test do
	gem "rspec-rails", "~> 2.13.0"
	gem "fabrication", ">= 2.7.0"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.3'
 	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '~> 2.1.0'
	gem 'compass-rails'
end


group :test do
	gem "database_cleaner", ">= 0.9.1"
	gem "email_spec", ">= 1.4.0"
	gem "capybara", "~> 2.1.0"
	gem "launchy"
	gem "guard-rspec"
	gem "faker"
end

group :production do
	gem "unicorn", ">= 4.3.1"
end
