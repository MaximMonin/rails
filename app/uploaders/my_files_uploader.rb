class MyFilesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  permissions = 0666
  directory_permissions = 0777

  def move_to_cache
    true
  end
  def move_to_store
    true
  end
  def store_dir
    "/app/storage/myfiles"
  end
  def cache_dir
    '/app/storage/cache'
  end

  version :preview do
    process resize_to_fill: [300,300]
  end  
end
