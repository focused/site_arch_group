class AddContentToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :content_ru, :text
    add_column :awards, :content_en, :text
  end
end
