class AddProjectCategoryIdToProjects < ActiveRecord::Migration
  def up
    add_column :projects, :project_category_id, :integer

    Project.all.each_with_index do |pr, n|
      pr.save
      say "*** #{ n }. ProjectCategory ##{ pr.project_category_id } linked with Project ##{ pr.id }"
    end
  end

  def down
    remove_column :projects, :project_category_id, :integer
  end
end
