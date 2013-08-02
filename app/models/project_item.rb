class ProjectItem < ActiveRecord::Base
  mount_uploader :picture, ProjectItemPictureUploader
  validates_presence_of :picture

  belongs_to :project, inverse_of: :project_items

  def other
    self.class
      .where(project_id: project_id)
      .where.not(id: id)
  end

  def get_size
    double ? [168, 57] : [76, 57]
  end

  def next
    return unless project_id
    item = other
      .where('position >= ?', position)
      .order(position: :asc, id: :asc).first
    item || other.order(position: :asc, id: :asc).first
  end

  def prev
    return unless project_id
    item = other
      .where('position <= ?', position)
      .order(position: :desc, id: :desc).first
    item || other.order(position: :asc, id: :asc).last
  end

  after_save :recreate_delayed_versions!
  def recreate_delayed_versions!
    picture.recreate_versions!(:preview)
  end
end
