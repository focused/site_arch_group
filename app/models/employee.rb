class Employee < ActiveRecord::Base
  mount_uploader :photo, EmployeePhotoUploader
  validates_presence_of :photo

  validate :name, length: { max: 255 }
  validates_presence_of :name

  validate :post, length: { max: 255 }
end
