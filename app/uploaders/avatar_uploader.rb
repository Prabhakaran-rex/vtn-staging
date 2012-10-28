# encoding: utf-8
class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage FILE_STORAGE[Rails.env]['storage'] == 'filesystem' ? :file : :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
    "http://media.valuethisnow.com.s3.amazonaws.com/images/missingAvatar.png"
  end

  # Create different versions of your uploaded files:
  version :small do
    process :crop
    resize_to_fill(100,100)
  end

  version :standard do
    resize_to_limit(600, 600)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def crop
    if model.crop_avatar_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_avatar_x.to_i
        y = model.crop_avatar_y.to_i
        w = model.crop_avatar_w.to_i
        h = model.crop_avatar_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end
end
