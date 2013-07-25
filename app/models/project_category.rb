class ProjectCategory < ActiveRecord::Base
  validate :title, length: { max: 255 }
  validates_presence_of :title

  has_many :project_groups, inverse_of: :project_category
  accepts_nested_attributes_for :project_groups, allow_destroy: true

  def projects
    group_ids = project_groups.order(:position).pluck(:id)
    return if group_ids.empty?
    Project.where("project_group_id IN (#{ group_ids.join(',') })")
      .order(:position).all
  end
end
