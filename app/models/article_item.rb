class ArticleItem < ActiveRecord::Base
  mount_uploader :picture, ArticleItemPictureUploader
  validates_presence_of :picture

  belongs_to :article, inverse_of: :article_items

  def other
    self.class
      .where(project_id: project_id)
      .where.not(id: id)
  end

  def next
    return unless project_id
    item = other
      .where('position >= ? OR position IS NULL', position)
      .order(position: :asc, id: :asc).first
    item || other.order(position: :asc, id: :asc).first
  end

  def prev
    return unless project_id
    item = other
      .where('position <= ? OR position IS NULL', position)
      .order(position: :desc, id: :desc).first
    item || other.order(position: :asc, id: :asc).last
  end
end
