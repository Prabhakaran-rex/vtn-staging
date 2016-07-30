# encoding: utf-8

class SignatureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::Compatibility::Paperclip

  def method_name
    FILE_STORAGE[Rails.env]['path']
  end
  # Choose what kind of storage to use for this uploader:
  storage FILE_STORAGE[Rails.env]['storage'] == 'filesystem' ? :file : :fog

  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "https://s3.amazonaws.com/media.valuethisnow.com/images/missingSignature.png"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :standard do
    process :crop
    resize_and_pad(250,100,"#ffffff")
  end

  def crop
    if model.crop_x.present?
      resize_and_pad(250, 100)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end
end
