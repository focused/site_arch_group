class ProjectItemPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process quality: 100

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :full do
    process resize_to_limit: [2000, 2000]
  end

  version :main do
    process resize_and_pad: [1000, 590]
  end

  version :preview do
    process dynamic_process: true
  end

  protected

  def dynamic_process(*args)
    resize_to_fit *(model.get_size) if model.persisted?
  end
end
