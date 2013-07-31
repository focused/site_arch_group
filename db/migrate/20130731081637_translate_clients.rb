class TranslateClients < ActiveRecord::Migration
  def change
    rename_column :clients, :title, :title_ru
    add_column :clients, :title_en, :string
  end
end
