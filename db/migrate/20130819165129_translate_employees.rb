class TranslateEmployees < ActiveRecord::Migration
  def change
    rename_column :employees, :name, :name_ru
    add_column :employees, :name_en, :string
    rename_column :employees, :post, :post_ru
    add_column :employees, :post_en, :string
  end
end
