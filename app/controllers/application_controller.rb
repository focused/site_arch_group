class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :set_locale

  layout :resolve_layout

  def default_url_options
    f = r18n.locale.code == zone_locale || Rails.env.test?
    { locale: f ? nil : r18n.locale.code }
  end

  protected

  def set_locale
    params[:locale] ||=  zone_locale
    session[:prev_locale] ||= zone_locale
    if session[:prev_locale] != params[:locale] || came_from_other_zone?(params[:locale])
      clear_locale_cache
    end
  end

  def resolve_layout
    f = controller_name == 'web_documents' && action_name == 'home'
    f ? 'application' : 'inner'
  end

  def zone_locale(host = request.host)
    zone = host.split(/\./)[-1]
    zone.in?(%w(com net org)) ? 'en' : 'ru'
  end

  def came_from_other_zone?(locale)
    return unless request.referer
    zone_locale(URI(request.referer).host) != locale
  end

  def clear_locale_cache
    R18n.get.try(:reload!)
    R18n.clear_cache!
    R18n::Rails::Filters.reload!
  end
end
