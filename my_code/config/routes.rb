Rails.application.routes.draw do
  resources :microposts
  resources :users
  resources :shops
  resources :categories
  resources :articles
  get 'pages/index'
  
  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
