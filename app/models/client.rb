class Client < ActiveRecord::Base
  mount_uploader :picture, ClientPictureUploader
  validates_presence_of :picture

  validate :title, length: { max: 255 }
  validates_presence_of :title
end
