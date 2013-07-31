class TranslateProjectGroups < ActiveRecord::Migration
  def change
    rename_column :project_groups, :title, :title_ru
    add_column :project_groups, :title_en, :string
  end
end
