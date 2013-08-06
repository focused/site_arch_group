class ArticlePictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process quality: 100
  process resize_to_limit: [800, 800]

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :item do
    process resize_and_pad: [78, 100]
  end
end
