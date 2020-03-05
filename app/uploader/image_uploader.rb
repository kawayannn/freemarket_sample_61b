# Choose what kind of storage to use for this uploader:
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fit: [100, 100]
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # Choose what kind of storage to use for this uploader:

  def store_dir
    "uploads/# {model.class.to_s.underscore}/# {mounted_as}/# {model.id}"
  end
end