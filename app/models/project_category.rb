class ProjectCategory < ActiveRecord::Base
  include R18n::Translated
  translations :title
  before_save do
    self.title_en = nil if title_en.blank?
  end

  validate :title_ru, length: { max: 255 }
  validate :title_en, length: { max: 255 }
  validates_presence_of :title_ru

  has_many :project_groups, inverse_of: :project_category
  accepts_nested_attributes_for :project_groups, allow_destroy: true

  def projects
    group_ids = project_groups.order(:position).pluck(:id)
    return if group_ids.empty?

    projects = Project
      .distinct
      .joins(:project_group)
      .where("project_group_id IN (#{ group_ids.join(',') })")
      .order('projects.position')
      .index_by(&:id)

    found_parents = []
    ar = []
    if projects
      projects.each do |id, pr|
        if pr.parent
          unless projects[pr.project_id] || found_parents.include?(pr.project_id)
            ar << pr.parent
            found_parents << pr.project_id
          end
        else
          ar << pr
        end
      end
    end
    ar
  end

  def groups
    all_group = ProjectGroup.new(title: I18n.t('helpers.labels.all'))
    [all_group] + project_groups
  end
end
