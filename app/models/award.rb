class Award < ActiveRecord::Base
  mount_uploader :picture, AwardPictureUploader
  validates_presence_of :picture
end
