class SiteController < ApplicationController
  include Eon::Functional

  layout :resolve_layout

  before_action :shared_procs

  protected

  def shared_procs
    # let(:projects_index) { Gallery.new.index }
    # let -> projects_index { Gallery.new.index }
  end

  def resolve_layout
    if (controller_name == 'web_documents' && action_name == 'home')
      return 'application'
    end
    'inner'
  end
end
