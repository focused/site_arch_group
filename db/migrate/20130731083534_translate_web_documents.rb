class TranslateWebDocuments < ActiveRecord::Migration
  def change
    rename_column :web_documents, :title, :title_ru
    add_column :web_documents, :title_en, :string
  end
end
