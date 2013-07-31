class News < ActiveRecord::Base
  include R18n::Translated
  translations :content
  before_save do
    self.content_en = nil if content_en.blank?
  end

  mount_uploader :picture, NewsPictureUploader

  scope :recent, -> n { limit(n).order(:created_at) }

  validates_presence_of :content_ru

  validates_presence_of :created_at
  # validate :created_at_is_valid_datetime

  # def created_at_is_valid_datetime
  #   return unless (DateTime.parse(created_at) rescue ArgumentError) == ArgumentError
  #   errors.add(:created_at, 'must be a valid datetime')
  # end

  def intro
    s = if (par1 = content[/<p>(.+?)<\/p>/m, 1])
      par1.strip
    else
      content
    end
  end
end
