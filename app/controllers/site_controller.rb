class SiteController < ApplicationController
  before_action :shared_procs
  before_action :meta_tags

  protected

  def shared_procs
    @project_categories = ProjectCategory.order(:position)
    @layout_doc = WebDocument.where(alias_name: 'layout').first
  end

  def meta_tags(meta = {})
    # meta = PageMetaTag.by_path(params[:path] || request.path, "/#{params[:controller]}")
    meta[:title] ||= t('.title')
    set_meta_tags(
      site: t.app.name,
      title: meta[:title].present? ? meta[:title] : t.meta.title,
      description: meta[:description].present? ? meta[:description].to_str : t.meta.description,
      keywords: meta[:keywords].present? ? meta[:keywords].to_str : t.meta.keywords
    )
  end
end
