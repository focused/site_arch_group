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
      @group.filtered_projects
    else
      @category.filtered_projects
    end
  end

  def show
    @project = Project.find params[:id]
    @project = @project.parent if @project.parent
    meta_tags title: [@project.title]
  end
end
