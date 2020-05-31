Rails.application.routes.draw do
  get 'welcome/index'
  
  get 'articles/new' => 'articles#new'
  get 'articles/:slug' => 'articles#show'
 
  resources :articles do
    resources :comments
  end
  

  root 'welcome#index'
end
