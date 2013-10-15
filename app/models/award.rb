class Award < ActiveRecord::Base
  include R18n::Translated
  translations :content
  before_save do
    self.content_en = nil if content_en.blank?
  end

  mount_uploader :picture, AwardPictureUploader
  validates_presence_of :picture
end
