SiteArchGroup::Application.routes.draw do
  resources :projects, only: %i(index show)
  resources :awards, only: %i(index show)
  resources :articles, only: %i(index show)
  resources :news, only: %i(index)

  get ':action' => 'web_documents', constraints: { action: /[a-z]+/ }, as: 'web'

  root 'web_documents#home'
end
