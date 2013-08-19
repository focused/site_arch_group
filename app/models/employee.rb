class Employee < ActiveRecord::Base
  include R18n::Translated
  translations :name, :post
  before_save do
    self.name_en = nil if name_en.blank?
    self.post_en = nil if post_en.blank?
  end

  mount_uploader :photo, EmployeePhotoUploader
  validates_presence_of :photo

  validate :name, length: { max: 255 }
  validates_presence_of :name

  validate :post, length: { max: 255 }
end
