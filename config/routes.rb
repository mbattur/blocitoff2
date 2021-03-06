Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'
  
  root 'welcome#index'
  
  resources :users, only: [:show] do
    resources :items, only: [:new, :destroy, :create]
  end
end
