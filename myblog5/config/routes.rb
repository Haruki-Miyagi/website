Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get 'heros/index'
  get 'heros/new'
  post 'heros/new' => 'heros#new'

  get 'stocks/index'
  post 'stocks/index'

end
