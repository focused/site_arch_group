class CreateProjectGroups < ActiveRecord::Migration
  def change
    create_table :project_groups do |t|
      t.string :title
      t.integer :position
      t.references :project_category, index: true

      t.timestamps
    end
  end
end
