class ProjectItem < ActiveRecord::Base
  mount_uploader :picture, ProjectItemPictureUploader
  validates_presence_of :picture

  belongs_to :project, inverse_of: :project_items

  def get_size
    double ? [168, 57] : [76, 57]
  end

  after_save :recreate_delayed_versions!
  def recreate_delayed_versions!
    picture.recreate_versions!
  end
end
