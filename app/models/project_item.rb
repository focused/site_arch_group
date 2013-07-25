class ProjectItem < ActiveRecord::Base
  mount_uploader :picture, ProjectItemPictureUploader
  validates_presence_of :picture

  belongs_to :project, inverse_of: :project_items
end
