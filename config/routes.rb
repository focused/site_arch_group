SiteArchGroup::Application.routes.draw do

  get 'projects(/category/:category)(/group/:group)' => 'projects#index', as: 'projects'
  resources :projects, only: %i(show)
  resources :awards, only: %i(index show)
  resources :articles, only: %i(index show)
  resources :news, only: %i(index)


  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  get ':action' => 'web_documents', constraints: { action: /[a-z]+/ }, as: 'web'

  root 'web_documents#home'
end
