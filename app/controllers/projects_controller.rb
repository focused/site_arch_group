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

    @projects = if @group && @group.persisted?
      @group.projects.order(:position)
    else
      @category.projects
    end

    if @projects
      @projects.each_with_index do |pr, n|
        @projects[n] = pr.parent if pr.parent
      end
    end
  end

  def show
    @project = Project.find params[:id]
    @project = @project.parent if @project.parent
    meta_tags title: [@project.title]
  end
end
