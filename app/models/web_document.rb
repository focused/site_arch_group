class WebDocument < ActiveRecord::Base
  include R18n::Translated
  translations :title
  before_save do
    self.title_en = nil if title_en.blank?
  end

  validate :title_ru, length: { max: 255 }
  validate :title_en, length: { max: 255 }
  validates_presence_of :title_ru

  # validate :alias_cant_change
  # def alias_cant_change
  #   return if new_record?
  #   errors.add(:alias_name, 'can not change')
  # end

  has_many :web_sections, inverse_of: :web_document
  accepts_nested_attributes_for :web_sections, allow_destroy: false

  def section(alias_name)
    web_sections.where(alias_name: alias_name).first
  end
end
