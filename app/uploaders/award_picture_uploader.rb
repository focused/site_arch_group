class AwardPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process quality: 100
  process resize_to_limit: [1600, 1200]

  version :thumb do
    process quality: 100
    process resize_to_fill: [50, 50]
  end

  version :main do
    process quality: 100
    process resize_to_fit: [500, 550]
  end

  version :item do
    process quality: 100
    process resize_and_pad: [78, 100]
  end
end
