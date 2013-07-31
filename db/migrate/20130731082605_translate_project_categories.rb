class TranslateProjectCategories < ActiveRecord::Migration
  def change
    rename_column :project_categories, :title, :title_ru
    add_column :project_categories, :title_en, :string
  end
end
