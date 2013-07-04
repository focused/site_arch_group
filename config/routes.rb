SiteArchGroup::Application.routes.draw do
  resources :news, only: %i(index show)

  get ':action' => 'web_documents', constraints: { action: /[a-z]+/ }, as: 'web'

  root 'web_documents#home'
end
