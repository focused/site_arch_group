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

  has_and_belongs_to_many :projects, uniq: true
  accepts_nested_attributes_for :projects, allow_destroy: true

  def name
    [project_category.try(:title_ru), title_ru].reject(&:blank?).join('-')
  end
end
