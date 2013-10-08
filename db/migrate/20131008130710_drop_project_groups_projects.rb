class DropProjectGroupsProjects < ActiveRecord::Migration
  def up
    drop_table :project_groups_projects
  end

  def down
    create_table :project_groups_projects, id: false do |t|
      t.references :project_group
      t.references :project
    end

    add_index :project_groups_projects, [:project_group_id, :project_id],
      unique: true, name: 'by_group_and_project'

    Project.limit(1000).each do |pr|
      execute "
        INSERT INTO project_groups_projects
        VALUES (#{ pr.project_group_id }, #{ pr.id })"
    end
  end
end
