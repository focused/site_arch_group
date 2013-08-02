class ClientPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process quality: 100
  process resize_to_fit: [500, 500]

  version :thumb do
    process quality: 100
    process resize_to_fill: [50, 50]
  end

  version :item do
    process quality: 100
    process resize_and_pad: [170, 80]
  end
end
