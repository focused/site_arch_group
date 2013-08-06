class GalleryItemPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process quality: 100

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :main do
    process resize_to_fit: [1600, 960]
  end
end
