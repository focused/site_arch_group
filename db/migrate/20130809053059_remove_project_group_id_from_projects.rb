class RemoveProjectGroupIdFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :project_group_id
  end

  def down
    add_column :projects, :project_group_id, :integer
  end
end
