class ProjectGroup < ActiveRecord::Base
  include R18n::Translated
  translations :title
  before_save do
    self.title_en = nil if title_en.blank?
  end

  validate :title_ru, length: { max: 255 }
  validate :title_en, length: { max: 255 }
  validates_presence_of :title_ru

  belongs_to :project_category, inverse_of: :project_groups

  has_many :projects, inverse_of: :project_group #, uniq: true
  accepts_nested_attributes_for :projects, allow_destroy: true

  # def name_a
  #   "#{ title_ru } (#{ id })"
  # end

  def filtered_projects
    found_parents = []
    ar = []

    projects.order('projects.position').distinct.index_by(&:id).each do |id, pr|
      if pr.parent
        unless found_parents.include?(pr.project_id)
          ar << pr.parent
          found_parents << pr.project_id
        end
      elsif found_parents.exclude?(id)
        ar << pr
        found_parents << id
      end
    end

    ar
  end

  def name
    s = [
      project_category ? "#{ project_category.title_ru } (#{ project_category.id })" : nil,
      "#{ title_ru } (#{ id })"
    ].join(' -> ')
  end
end
