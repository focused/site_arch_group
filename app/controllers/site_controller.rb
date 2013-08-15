class SiteController < ApplicationController
  before_action :shared_procs

  protected

  def shared_procs
    @project_categories = ProjectCategory.order(:position)
    @layout_doc = WebDocument.where(alias_name: 'layout').first
  end
end
