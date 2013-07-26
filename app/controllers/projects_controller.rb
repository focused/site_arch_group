class ProjectsController < SiteController
  def index
    @category = if params[:category]
      ProjectCategory.find(params[:category])
    else
      ProjectCategory.order(:position).first
    end

    @group = if params[:group]
      ProjectGroup.find(params[:group])
    else
      @category.groups.first
    end

    @projects = if @group && @group.persisted?
      @group.projects.order(:position).all
    else
      @category.projects
    end
  end

  def show
    @project = Project.find params[:id]
  end
end
