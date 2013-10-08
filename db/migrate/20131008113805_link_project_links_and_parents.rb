class LinkProjectLinksAndParents < ActiveRecord::Migration
  def up
    projects = Project.select([:id, 'projects.project_id', 'pgp.project_id', :title_ru])
      .distinct
      .joins('
        INNER JOIN project_groups_projects pgp
        ON projects.id = pgp.project_id'
      )
      .group('pgp.project_id, projects.id')
      .having('COUNT(pgp.project_id) > 1')

    projects.each do |pr|
      head, *tail = pr.project_groups
      tail.each do |pg|
        pr_link = Project.new(title_ru: pr.title_ru, project_id: pr.id)
        pr_link.project_groups = [pg]
        pr_link.save!(validate: false)
      end
      pr.project_groups = [head]
    end
  end

  def down
    Project.where('project_id IS NOT NULL').each do |pr_link|
      pr = pr_link.parent
      if pr_link.project_groups[0]
        pr.project_groups << pr_link.project_groups[0]
      end
      pr_link.destroy!
    end
  end
end
