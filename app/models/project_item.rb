class ProjectItem < ActiveRecord::Base
  mount_uploader :picture, ProjectItemPictureUploader
  validates_presence_of :picture

  belongs_to :project, inverse_of: :project_items

  def get_size
    double ? [168, 57] : [76, 57]
  end
end
