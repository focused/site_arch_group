class WebSectionPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process resize_to_limit: [1600, 1200]
  process quality: 100

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :main do
    process resize_to_fit: [725, 600]
  end
end