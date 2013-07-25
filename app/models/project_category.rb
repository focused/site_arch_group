class ProjectCategory < ActiveRecord::Base
  validate :title, length: { max: 255 }
  validates_presence_of :title

  has_many :project_groups, inverse_of: :project_category
end
