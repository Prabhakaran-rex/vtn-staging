# Load the rails application
require File.expand_path('../application', __FILE__)
require 'yaml'
YAML::ENGINE.yamler = 'psych'
#
# Initialize the rails application
PurexNew::Application.initialize!

# TODO Move this to a separate config file
PAYMENT_PLAN = Array.[](19.95, 36.95, 29.00, 44.95,39.95, 56.95, 49.00, 64.95) #define in appraisals.selected_plan
PAYMENT_PLAN_FOR_PARTNER = Hash(1 => "short_restricted", 2 => "full_restricted", 4 => "full_use")