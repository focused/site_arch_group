class Article < ActiveRecord::Base
  include R18n::Translated
  translations :title, :content
  before_save do
    self.title_en = nil if title_en.blank?
    self.content_en = nil if content_en.blank?
  end

  mount_uploader :picture, ArticlePictureUploader
  validates_presence_of :picture

  validate :title_ru, length: { max: 255 }
  validate :title_en, length: { max: 255 }
  validates_presence_of :title_ru

  has_many :article_items, inverse_of: :article
  accepts_nested_attributes_for :article_items, allow_destroy: true
end
