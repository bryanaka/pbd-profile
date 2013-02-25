source 'https://rubygems.org'
gem 'rails', '3.2.12'

# Universal Gems
gem 'jquery-rails'
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.4"
gem "figaro", ">= 0.5.3"
# pg is producing errors on test server. using sqlite temporarily
# gem "pg", ">= 0.14.1"
# gem "sqlite3"
gem "strong_parameters"
gem 'carrierwave'

group :development do
	gem "better_errors", ">= 0.6.0"
	gem "binding_of_caller", ">= 0.6.9"
	gem "pg"
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
	# nokogiri is producing errors on server, a dependency of capybara
	# gem "capybara", ">= 2.0.2"
end

group :production do
	gem "unicorn", ">= 4.3.1"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
