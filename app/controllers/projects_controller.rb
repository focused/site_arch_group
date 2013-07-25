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
      @category.project_groups.order(:position).first
    end

    @projects = @group.projects.order(:position).all if @group
  end

  def show

  end
end
