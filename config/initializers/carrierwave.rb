S3_VARS = YAML.load_file(File.join(Rails.root, "config", "s3.yml"))
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => S3_VARS[Rails.env]['access_key_id'],
    :aws_secret_access_key  => S3_VARS[Rails.env]['secret_access_key'],
    :persistent             => false # This is required to prevent write timeouts from PUT requests to S3
  }
  config.fog_directory  = S3_VARS[Rails.env]['bucket']
end
