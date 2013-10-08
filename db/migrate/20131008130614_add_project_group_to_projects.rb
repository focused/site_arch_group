class AddProjectGroupToProjects < ActiveRecord::Migration
  def up
    add_column :projects, :project_group_id, :integer

    Project.limit(1000).each do |pr|
      res = execute "
        SELECT project_group_id FROM project_groups_projects
        WHERE project_id = #{ pr.id }"
      if res[0]['project_group_id'].present?
        pr.update_column :project_group_id, res[0]['project_group_id']
      end
    end
  end

  def down
    remove_column :projects, :project_group_id
  end
end
