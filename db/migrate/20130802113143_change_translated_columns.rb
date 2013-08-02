class ChangeTranslatedColumns < ActiveRecord::Migration
  def change
    change_column :projects, :content_en, :text
    change_column :web_sections, :content_en, :text
    change_column :news, :content_en, :text
    change_column :articles, :content_en, :text
  end
end
