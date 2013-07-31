class TranslateNews < ActiveRecord::Migration
  def change
    rename_column :news, :content, :content_ru
    add_column :news, :content_en, :string
  end
end
