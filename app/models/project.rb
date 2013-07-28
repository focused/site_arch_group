class Project < ActiveRecord::Base
  mount_uploader :picture, ProjectPictureUploader
  validates_presence_of :picture

  validate :title, length: { max: 255 }
  validates_presence_of :title

  belongs_to :project_group, inverse_of: :projects
  has_many :project_items, inverse_of: :project
  accepts_nested_attributes_for :project_items, allow_destroy: true

  def main_item
    project_items.order(:position).first
  end

  def items
    project_items.order(:position).all
  end

  def get_size
    vertical ? [135, 180] : [236, 120]
  end

  after_save :recreate_delayed_versions!
  def recreate_delayed_versions!
    picture.recreate_versions!
  end
end
