source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# For Twitter bootstrap
gem 'sass-rails',   '~> 3.2.3'
gem 'bootstrap-sass', '~> 2.0.3'

# For storage of assets
gem 'paperclip'
gem 'aws-s3'

# authentication
gem 'devise' #this is our usermanagement system
gem "omniauth"
# gem "oa-oauth", :require => "omniauth/oauth"  #this allows us to use things like facebook sign in
gem 'omniauth-facebook'
gem "cancan" #this form the basis of user permissions

gem 'heroku'
# gem "heroku_backup_task"   #takes care of backing up the database via a cron job
gem 'will_paginate'  #means lists of active objects can be paginated
gem 'haml' #more consise template files, easier to read and maintain

gem 'activemerchant'#, '1.23.0', :require => 'active_merchant'

# To use Jbuilder templates for JSON
gem 'jbuilder'

gem 'simple_form'

group :test, :development do
  gem 'rspec-rails'
  gem 'spork'
  gem 'cucumber-rails'   #for human language testing
  gem 'capybara'     #like selnium for integration testing
  gem 'launchy'      #allows tests to launch a browser
end

group :test do
  gem 'rspec'
  gem 'email_spec' #mock framework for emails
  gem 'factory_girl'     #factory helper for testing
  gem 'factory_girl_rails' #factory helper for testing
end
