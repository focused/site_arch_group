class CreateProjectItems < ActiveRecord::Migration
  def change
    create_table :project_items do |t|
      t.string :picture
      t.integer :position
      t.references :project, index: true
    end
  end
end
