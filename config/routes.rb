SiteArchGroup::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #elfinder
  # get 'filemanager/:action' => 'file_manager', constraints: { action: /elfinder|browser/ }
  # get 'filemanager' => 'file_manager#index'

  # get '/:locale' => 'web_documents#home'
  scope '(:locale)', locale: /ru|en/ do
    get 'projects(/category/:category)(/group/:group)' => 'projects#index', as: 'projects'
    resources :projects, only: %i(show)
    resources :project_items, only: %i(show)

    resources :awards, only: %i(index show)
    resources :articles, only: %i(index show)
    resources :news, only: %i(index)


    devise_for :users

    get ':action' => 'web_documents', constraints: { action: /[a-z]{3,}/ }, as: 'web'

    root 'web_documents#home'
  end

end
