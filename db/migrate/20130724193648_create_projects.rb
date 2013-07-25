class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.references :project_group, index: true

      t.timestamps
    end
  end
end
