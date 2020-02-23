Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  

  
  resources :users do
    resources :posts, only: [:show, :index, :new]
  end
  
  resources :posts
  
  resources :posts do
    resources :comments
  end

  resources :users, only: [:show, :index]

  
  root 'welcome#index'


  


end
