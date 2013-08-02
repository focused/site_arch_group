class ProjectItemsController < ApplicationController
  def show
    @project_item = ProjectItem.find params[:id]
  end
end
