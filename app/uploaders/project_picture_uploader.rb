class ProjectPictureUploader < ApplicationUploader
  after :cache, :delete_tmp_dir

  process resize_to_fit: [132, 92]

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :index_item do
    process resize_to_fit: [105, 83]
  end

  version :item do
    process dynamic_process: true
  end

  protected

  def dynamic_process(*args)
    resize_to_fit *(model.get_size) if model.persisted?
  end
end
