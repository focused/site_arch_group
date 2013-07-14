SiteArchGroup::Application.routes.draw do
  resources :awards, only: %i(index)
  resources :articles, only: %i(index)
  resources :news, only: %i(index)

  get ':action' => 'web_documents', constraints: { action: /[a-z]+/ }, as: 'web'

  root 'web_documents#home'
end
