class Client < ActiveRecord::Base
  include R18n::Translated
  translations :title
  before_save do
    self.title_en = nil if title_en.blank?
  end

  mount_uploader :picture, ClientPictureUploader
  validates_presence_of :picture

  validate :title_ru, length: { max: 255 }
  validate :title_en, length: { max: 255 }
  validates_presence_of :title_ru
end
