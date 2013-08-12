class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :set_locale

  layout :resolve_layout

  def default_url_options
    # { locale: nil }
    { locale: (r18n.locale.code == 'ru' || Rails.env.test?) ? nil : r18n.locale.code }
  end

  protected

  def set_locale
    params[:locale] ||= 'ru'

    if (session[:prev_locale] ||= 'ru') != params[:locale]
      R18n.get.try(:reload!)
      # R18n.clear_cache!
      # R18n::Rails::Filters.reload!
    end
    session[:prev_locale] = params[:locale]
  end

  def resolve_layout
    if (controller_name == 'web_documents' && action_name == 'home')
      return 'application'
    end
    'inner'
  end
 end
