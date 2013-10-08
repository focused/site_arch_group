class ProjectsController < SiteController
  def index
    @category = if params[:category]
      ProjectCategory.find(params[:category])
    else
      ProjectCategory.order(:position).first
    end

    @group = if params[:group]
      gr = ProjectGroup.find(params[:group])
      meta_tags title: [@category.title, gr.title]
      gr
    else
      meta_tags title: [@category.title]
      @category.groups.first
    end

    projects = if @group && @group.persisted?
      @group.projects.order(:position).index_by(&:id)
    else
      @category.projects.index_by(&:id)
    end

    found_parents = []
    @projects = []
    if projects
      projects.each do |id, pr|
        if pr.parent
          unless projects[pr.project_id] || found_parents.include?(pr.project_id)
            @projects << pr.parent
            found_parents << pr.project_id
          end
        else
          @projects << pr
        end
      end
    end
  end

  def show
    @project = Project.find params[:id]
    @project = @project.parent if @project.parent
    meta_tags title: [@project.title]
  end
end
