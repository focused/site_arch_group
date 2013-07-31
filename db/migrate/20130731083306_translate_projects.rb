class TranslateProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :content, :content_ru
    add_column :projects, :content_en, :string
    rename_column :projects, :title, :title_ru
    add_column :projects, :title_en, :string
  end
end
