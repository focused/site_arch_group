class GalleryItem < ActiveRecord::Base
  mount_uploader :picture, GalleryItemPictureUploader
  validates_presence_of :picture
end
