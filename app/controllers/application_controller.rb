class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :set_locale

  layout :resolve_layout

  protected

  def set_locale
    params[:locale] ||= :ru
  end

  def resolve_layout
    if (controller_name == 'web_documents' && action_name == 'home')
      return 'application'
    end
    'inner'
  end
 end
