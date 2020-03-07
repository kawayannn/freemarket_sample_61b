# Choose what kind of storage to use for this uploader:
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fit: [100, 100]
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end
end
#   # Choose what kind of storage to use for this uploader
#   def store_dir
#     "uploads/# {model.class.to_s.underscore}/# {mounted_as}/# {model.id}"
#   end

#    # 許可する画像の拡張子
#   def extension_whitelist
#     %w(jpg jpeg gif png)
#  end

#  # ファイル名を書き換える
#  def filename
#   "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.#{file.extension}" if original_filename
  #  end
