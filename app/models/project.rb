class Project < ActiveRecord::Base
  validate :title, length: { max: 255 }
  validates_presence_of :title

  belongs_to :project_group, inverse_of: :projects
end
