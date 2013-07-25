class WebSection < ActiveRecord::Base
  # validate :alias_cant_change
  # def alias_cant_change
  #   return if new_record?
  #   errors.add(:alias_name, 'can not change')
  # end

  belongs_to :web_document, inverse_of: :web_sections
end
