class Article < ActiveRecord::Base
  mount_uploader :picture, ArticlePictureUploader
  validates_presence_of :picture

  validate :title, length: { max: 255 }
  validates_presence_of :title
end
