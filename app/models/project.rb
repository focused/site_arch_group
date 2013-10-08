class Project < ActiveRecord::Base
  include R18n::Translated
  translations :title, :content
  before_save do
    self.title_en = nil if title_en.blank?
    self.content_en = nil if content_en.blank?
  end

  mount_uploader :picture, ProjectPictureUploader
  validates_presence_of :picture, unless: -> { project_id.present? }

  validate :title_ru, length: { max: 255 }
  validate :title_en, length: { max: 255 }
  validates_presence_of :title_ru

  belongs_to :project_group, inverse_of: :projects

  has_many :project_items, inverse_of: :project
  accepts_nested_attributes_for :project_items, allow_destroy: true

  belongs_to :parent, class_name: 'Project', foreign_key: 'project_id', inverse_of: :project_links
  has_many :project_links, class_name: 'Project', inverse_of: :parent

  def main_item
    items.first
  end

  def items
    project_items.order(:position, :id)
  end

  def get_size
    vertical ? [135, 180] : [236, 120]
  end

  after_save :recreate_delayed_versions!
  def recreate_delayed_versions!
    return unless picture.present?
    picture.recreate_versions!(:item)
  end

  def project_category_name
    return unless project_group
    project_group.project_category.try(:title)
  end
end
