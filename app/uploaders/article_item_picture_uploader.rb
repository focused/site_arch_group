class ArticleItemPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process quality: 100

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :full do
    process resize_to_limit: [1900, 1300]
  end

  version :main do
    process resize_to_fit: [1000, 590]
  end
end
