# Supported options: :resque, :sidekiq, :delayed_job, :queue_classic, :torquebox
Devise::Async.backend = :delayed_job
Devise::Async.enabled = (Rails.env == 'production') ? true : false
