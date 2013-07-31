class TranslateArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :content, :content_ru
    add_column :articles, :content_en, :string
    rename_column :articles, :title, :title_ru
    add_column :articles, :title_en, :string
  end
end
