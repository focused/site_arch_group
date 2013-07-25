class ProjectGroup < ActiveRecord::Base
  validate :title, length: { max: 255 }
  validates_presence_of :title

  belongs_to :project_category, inverse_of: :project_groups
  has_many :projects, inverse_of: :project_group
  accepts_nested_attributes_for :projects, allow_destroy: true
end
