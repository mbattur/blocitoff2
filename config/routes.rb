Rails.application.routes.draw do
  get 'items/new'

  get 'items/create'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'
  
  root 'welcome#index'
  
  resources :users, only: [:show] do
    resources :items, only: [:new, :create]
  end
end
