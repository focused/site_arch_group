require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminCloneByLink
end

module RailsAdmin
  module Config
    module Actions
      class CloneByLink < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-link'
        end

        register_instance_option :visible? do
          authorized? && !bindings[:object].parent.present?
        end

        register_instance_option :controller do
         proc do
           new_object = Project.new(title_ru: @object.title_ru, project_id: @object.id)
           @object = new_object
           # flash[:notice] = "You have approved the review titled: #{@object.title}."

           respond_to do |format|
              format.json { render json: @object }
              format.html { render :new }
            end
         end
       end
      end
    end
  end
end
