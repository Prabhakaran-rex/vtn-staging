# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PurexNew::Application.initialize!

# TODO Move this to a separate config file
PAYMENT_PLAN = Array.[](19.00, 29.00) #define in appraisals.selected_plan (0=>19.00, 1=>29.00)