class TranslateWebSections < ActiveRecord::Migration
  def change
    rename_column :web_sections, :content, :content_ru
    add_column :web_sections, :content_en, :string
  end
end
