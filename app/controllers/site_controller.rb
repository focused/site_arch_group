class SiteController < ApplicationController
  before_action :shared_procs

  protected

  def shared_procs
    @project_categories = ProjectCategory.order(:position)
  end
end
