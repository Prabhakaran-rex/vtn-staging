source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# group :production, :staging do
#   gem "wkhtmltopdf-heroku", "~> 1.0.0"
# end

gem 'wkhtmltopdf-binary'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.0.0'

# For Twitter bootstrap
gem 'sass-rails',   '~> 3.2.3'
gem 'bootstrap-sass', '~> 2.0.4.0'
# gem "bootstrap-sass", "~> 2.2.1.1"

gem "heroku-forward"

# For storage of assets
# TODO Move all storage from Paperclip to Carrierwave
gem 'paperclip'
gem 'carrierwave', '~> 0.7.0'
gem 'rmagick'
gem 'aws-s3'
gem 'aws-sdk'
gem "fog"

# authentication
gem 'devise' #this is our usermanagement system
gem "devise_security_extension", "~> 0.7.2"
gem "rails_email_validator", "~> 0.1.4"
gem "rolify"
gem "omniauth"
# gem "oa-oauth", :require => "omniauth/oauth"  #this allows us to use things like facebook sign in
gem 'omniauth-facebook'
gem "cancan" #this form the basis of user permissions
gem "switch_user", "~> 0.9.1"

gem 'heroku'
# gem "heroku_backup_task"   #takes care of backing up the database via a cron job
gem 'will_paginate'  #means lists of active objects can be paginated
gem 'haml' #more consise template files, easier to read and maintain

gem 'activemerchant'#, '1.23.0', :require => 'active_merchant'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# For the skills categories and subcategories
gem 'ancestry'
gem "activerecord-import", "~> 0.2.11"

gem 'simple_form'
gem 'country_select'
gem 'wicked' # For wizard-type appraiser registration
gem 'wicked_pdf' # for PDF generation
gem "activeadmin", "~> 0.5.1"
gem 'meta_search',    '>= 1.1.0.pre'

gem 'comfortable_mexican_sofa'
gem "newrelic_rpm", "~> 3.5.4.33"

# Complaint system linked to Lighthouse
gem "taskmapper", "~> 0.8.0"
gem "taskmapper-lighthouse", "~> 0.9.0"

# To retrieve Gravatar for appraiser and user profile
gem 'gravatar-ultimate'

# For Google Analytics tracking
gem 'google-analytics-rails'

# To track Sendgrid bounces in Admin panel
gem 'sendgrid_toolkit', '>= 1.1.1'

# For Paypal payouts
gem "ruby-paypal", :git => "git://github.com/Reprazent/ruby-paypal.git"

# For SMS Notifications
gem "nexmo", "~> 1.0.0"
gem "phony_rails", "~> 0.1.12"

# Sensitive data encryption
# gem "attr_encrypted", :git => 'git://github.com/yellow-lab/attr_encrypted_1_9_3_charset_fix.git'
gem "attr_encrypted", "~> 1.2.1"
gem "acts_as_commentable_with_threading", "~> 1.1.2"
# For activerecord versioning
gem "paper_trail", "~> 2.6.4"

# For blogging
gem 'refinerycms-dashboard', '~> 2.0.9'
gem 'refinerycms-images', '~> 2.0.9'
gem 'refinerycms-pages', '~> 2.0.9'
gem 'refinerycms-resources', '~> 2.0.9'
gem "refinerycms-blog", "~> 2.0.4"
gem "tilt", "1.3.4"

group :test, :development do
  gem 'rspec-rails'
  gem 'growl', "~> 1.0.3"
end

group :test do
  gem "factory_girl_rails", "~> 4.1.0"
  gem "capybara", "~> 2.0.1"
  gem "guard-rspec", "~> 2.3.3"
  gem "guard-cucumber", "~> 1.2.2"
  gem 'rb-fsevent', '~> 0.9.1'
  gem "cucumber-rails", "~> 1.3.0", :require => false
  gem "database_cleaner", "~> 0.9.1"
  gem "email_spec", "~> 1.4.0"
end
