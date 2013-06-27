SiteArchGroup::Application.routes.draw do
  get ':action' => 'web_documents', constraints: { action: /[a-z]+/ }, as: 'web'

  root 'web_documents#home'
end
