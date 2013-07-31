class WebSection < ActiveRecord::Base
  include R18n::Translated
  translations :content
  before_save do
    self.content_en = nil if content_en.blank?
  end

  mount_uploader :picture, WebSectionPictureUploader

  # validate :alias_cant_change
  # def alias_cant_change
  #   return if new_record?
  #   errors.add(:alias_name, 'can not change')
  # end

  belongs_to :web_document, inverse_of: :web_sections
end
