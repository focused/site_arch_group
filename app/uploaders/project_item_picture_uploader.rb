class ProjectItemPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process resize_to_limit: [1600, 1200]
  process quality: 100

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :main do
    process resize_to_limit: [800, 750]
  end

  version :preview do
    process dynamic_process: true
  end

  protected

  def dynamic_process(*args)
    resize_and_pad *(model.get_size) if model.persisted?
  end
end
