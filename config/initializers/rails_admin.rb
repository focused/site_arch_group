# RailsAdmin config file. Generated on July 23, 2013 00:32
# See github.com/sferik/rails_admin for more informations

require 'rails_admin_extension'


RailsAdmin.config do |config|

  # module RailsAdmin
  #   module Config
  #     module Actions
  #       class CloneByLink < RailsAdmin::Config::Actions::Base
  #         RailsAdmin::Config::Actions.register(self)
  #       end
  #     end
  #   end
  # end

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    # history_show
    show_in_app
    clone_by_link do
      only Project

    end
  end

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Site Arch Group', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['News']

  # Include specific models (exclude the others):
  # config.included_models = %w(News Article Award Client User)

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:

  config.model 'GalleryItem' do
    label I18n.t('admin.menu.gallery_item')
    label_plural I18n.t('admin.menu.gallery_items')
    navigation_icon 'icon-chevron-right'
    weight 101
    list do
      field :picture do
        column_width 120
      end
      field :position
      sort_by :position
    end
    edit do
      field :picture
      field :position
    end
    show do
      field :picture
      field :position
    end
  end

  config.model 'News' do
    label I18n.t('admin.menu.news_one')
    label_plural I18n.t('admin.menu.news')
    navigation_icon 'icon-chevron-right'
    weight 102
    list do
      field :picture do
        column_width 120
      end
      field :content_ru
      field :content_en
      field :created_at do
        sort_reverse true
      end
      sort_by :created_at
      field :updated_at
    end
    edit do
      field :created_at
      field :content_ru, :ck_editor
      field :content_en, :ck_editor
      field :picture
    end
    show do
      field :created_at
      field :content_ru
      field :content_en
      field :picture
      field :updated_at
    end
  end

  config.model 'Article' do
    label I18n.t('admin.menu.article')
    label_plural I18n.t('admin.menu.articles')
    navigation_icon 'icon-chevron-right'
    weight 103
    list do
      field :picture do
        column_width 120
      end
      field :title_ru
      field :title_en
      field :position
      sort_by :position
      field :created_at
      field :updated_at
    end
    edit do
      field :title_ru
      field :title_en
      field :picture
      field :position
      field :article_items
      field :content_ru, :ck_editor
      field :content_en, :ck_editor
    end
    show do
      field :title_ru
      field :title_en
      field :picture
      field :article_items
      field :content_ru
      field :content_en
      field :created_at
      field :updated_at
    end
  end

  config.model 'ArticleItem' do
    label I18n.t('admin.menu.article_item')
    label_plural I18n.t('admin.menu.article_items')
    navigation_icon 'icon-chevron-right'
    weight 104
    list do
      field :picture do
        column_width 120
      end
      field :article do
        sortable :position
      end
      field :position
      sort_by :position
    end
    edit do
      field :picture
      field :article
      field :position
    end
    show do
      field :picture
      field :article
    end
  end

  def project_parent_link(value)
    return '-' unless value
    h = bindings[:view]
    h.link_to(value.title, h.rails_admin.show_path(:project, value.id))
  end

  def project_parent_link_a(value)
    model = bindings[:object]
    return value unless model.respond_to?(:parent) && model.parent
    project_parent_link(model.parent)
  end

  def project_visible_field
    model = bindings[:object]
    return true unless model.respond_to?(:parent) && model.parent
    !model.parent.present?
  end

  def project_value_field(method, value)
    model = bindings[:object]
    return value unless model.respond_to?(:parent) && model.parent
    ''#model.parent.send(method)
  end

  config.model 'Project' do
    label I18n.t('admin.menu.project')
    label_plural I18n.t('admin.menu.projects')
    navigation_icon 'icon-chevron-right'
    weight 201
    list do
      field :picture
      field :title_ru do
        pretty_value { project_parent_link_a(value) }
      end
      # field :title_en
      # field :parent do
      #   pretty_value { project_parent_link(value) }
      # end
      field :project_category do
        # inverse_of :projects
        sortable :position
        visible false
        searchable [:title_ru, :id]
        # sort_reverse false
      end
      field :project_group do
        # inverse_of :projects
        sortable 'project_groups.project_category_id'
        # visible { project_visible_field }
        searchable [:title_ru, :id]
        # sort_reverse false
      end
      # field :project_category_name
      field :position
      sort_by "project_category_id, projects.position"
      sort_reverse false
      field :finished
      field :important
      field :created_at
      field :updated_at
    end
    edit do
      field :title_ru do
        visible { project_visible_field }
      end
      field :title_en do
        visible { project_visible_field }
      end
      field :position
      field :parent do
        read_only true
        formatted_value { project_parent_link(value) }
        visible { value.present? }
      end
      # field :project_links
      field :project_group do
        # inverse_of :projects
        # read_only true
        # formatted_value { value.id }
        sortable :project_category_id
      end
      field :picture do
        visible { project_visible_field }
      end
      field :finished do
        visible { project_visible_field }
      end
      field :important do
        visible { project_visible_field }
      end
      field :vertical do
        visible { project_visible_field }
      end
      field :content_ru, :ck_editor do
        visible { project_visible_field }
      end
      field :content_en, :ck_editor do
        visible { project_visible_field }
      end
      field :project_items do
        visible { project_visible_field }
      end
    end
    show do
      field :title_ru do
        visible { project_visible_field }
      end
      field :title_en do
        visible { project_visible_field }
      end
      field :position
      field :parent do
        pretty_value { project_parent_link(value) }
      end
      field :project_links do
        visible { project_visible_field }
      end
      field :project_category
      field :project_group
      # field :project_category_name
      field :picture do
        visible { project_visible_field }
      end
      field :finished do
        visible { project_visible_field }
      end
      field :important do
        visible { project_visible_field }
      end
      field :vertical do
        visible { project_visible_field }
      end
      field :content_ru do
        visible { project_visible_field }
      end
      field :content_en do
        visible { project_visible_field }
      end
      field :project_items do
        visible { project_visible_field }
      end
      field :created_at
      field :updated_at
    end
  end

  config.model 'ProjectItem' do
    label I18n.t('admin.menu.project_item')
    label_plural I18n.t('admin.menu.project_items')
    navigation_icon 'icon-chevron-right'
    weight 202
    list do
      field :picture do
        column_width 120
      end
      field :project do
        sortable :position
        searchable [:title_ru, :id]
      end
      field :position
      sort_by "project_id, project_items.position"
      sort_reverse false
    end
    edit do
      field :picture
      field :double
      field :project
      field :position
    end
    show do
      field :picture
      field :double
      field :project
    end
  end

  config.model 'ProjectGroup' do
    label I18n.t('admin.menu.project_group')
    label_plural I18n.t('admin.menu.project_groups')
    navigation_icon 'icon-chevron-right'
    weight 203
    # object_label_method :name
    list do
      field :name
      field :project_category do
        sortable :position
        searchable [:title_ru, :id]
      end
      field :position
      sort_by "project_category_id, project_groups.position"
      sort_reverse false
      field :created_at
      field :updated_at
    end
    edit do
      field :title_ru
      field :title_en
      field :project_category
      field :position
      field :projects do
        # inverse_of :project_groups
      end
    end
    show do
      field :title_ru
      field :title_en
      field :project_category
      field :projects do
        # inverse_of :project_groups
      end
      field :created_at
      field :updated_at
    end
  end

  config.model 'ProjectCategory' do
    label I18n.t('admin.menu.project_category')
    label_plural I18n.t('admin.menu.project_categories')
    navigation_icon 'icon-chevron-right'
    weight 204
    list do
      field :title_ru
      field :title_en
      field :position
      sort_by :position
      field :created_at
      field :updated_at
    end
    edit do
      field :title_ru
      field :title_en
      field :position
      field :project_groups
    end
    show do
      field :title_ru
      field :title_en
      field :project_groups
      field :created_at
      field :updated_at
    end
  end

  config.model 'Award' do
    label I18n.t('admin.menu.award')
    label_plural I18n.t('admin.menu.awards')
    navigation_icon 'icon-chevron-right'
    weight 301
    list do
      field :picture do
        column_width 120
      end
      field :position
      sort_by :position
      field :created_at
      field :updated_at
    end
    edit do
      field :picture
      field :position
    end
    show do
      field :picture
      field :created_at
      field :updated_at
    end
  end

  config.model 'Employee' do
    label I18n.t('admin.menu.employee')
    label_plural I18n.t('admin.menu.employees')
    navigation_icon 'icon-chevron-right'
    weight 302
    list do
      field :photo do
        column_width 120
      end
      field :name_ru
      field :name_en
      field :post_ru
      field :post_en
      field :position
      sort_by :position
      field :created_at
      field :updated_at
    end
    edit do
      field :name_ru
      field :name_en
      field :post_ru
      field :post_en
      field :photo
      field :position
    end
    show do
      field :name_ru
      field :name_en
      field :post_ru
      field :post_en
      field :photo
      field :created_at
      field :updated_at
    end
  end

  config.model 'Client' do
    label I18n.t('admin.menu.client')
    label_plural I18n.t('admin.menu.clients')
    navigation_icon 'icon-chevron-right'
    weight 303
    list do
      field :picture do
        column_width 120
      end
      field :title_ru
      field :title_en
      field :position
      sort_by :position
      field :created_at
      field :updated_at
    end
    edit do
      field :title_ru
      field :title_en
      field :picture
      field :position
    end
    show do
      field :title_ru
      field :title_en
      field :picture
      field :created_at
      field :updated_at
    end
  end

  config.model 'WebDocument' do
    label I18n.t('admin.menu.web_document')
    label_plural I18n.t('admin.menu.web_documents')
    navigation_icon 'icon-chevron-right'
    weight 401
    list do
      field :title_ru
      field :title_en
      field :alias_name
      field :position
      sort_by :position
      field :created_at
      field :updated_at
    end
    edit do
      field :title_ru
      field :title_en
      field :alias_name
      field :position
      field :web_sections
      field :project1
      field :project2
      field :project3
    end
    show do
      field :title_ru
      field :title_en
      field :alias_name
      field :web_sections
      field :project1
      field :project2
      field :project3
      field :created_at
      field :updated_at
    end
  end

  config.model 'WebSection' do
    label I18n.t('admin.menu.web_section')
    label_plural I18n.t('admin.menu.web_sections')
    navigation_icon 'icon-chevron-right'
    weight 402
    list do
      field :picture do
        column_width 120
      end
      field :alias_name
      field :web_document do
        sortable :position
      end
      field :position
      sort_by :web_document
    end
    edit do
      field :alias_name
      field :web_document do
        sortable :position
      end
      field :picture
      field :content_ru, :ck_editor
      field :content_en, :ck_editor
      field :position
    end
    show do
      field :alias_name
      field :web_document
      field :picture
      field :content_ru
      field :content_en
    end
  end

  config.model 'User' do
    label I18n.t('admin.menu.user')
    label_plural I18n.t('admin.menu.users')
    navigation_icon 'icon-chevron-right'
    weight 1101
    list do
      field :email
      field :sign_in_count
      field :created_at
      field :updated_at
    end
    edit do
      field :email
      field :password
      field :password_confirmation
    end
    show do
      field :email
      field :sign_in_count
      field :created_at
      field :updated_at
    end
  end

  ###  News  ###

  # config.model 'News' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your news.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer
  #     configure :title, :string
  #     configure :content, :text
  #     configure :picture, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
