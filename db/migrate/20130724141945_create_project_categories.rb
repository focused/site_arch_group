class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
