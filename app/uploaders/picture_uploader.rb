class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => 'appraisal_photo'

  def default_url
    "/assets/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  version :large do
    process :resize_to_fit => [500, 500]
  end

  version :medium do
    process :resize_to_fit => [250, 250]
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :carrousel do
    process :resize_to_fill => [460, 460]
  end

  version :huge do
    process :resize_to_fit => [2048, 2048]
  end
end
