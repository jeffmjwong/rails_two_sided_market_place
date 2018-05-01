Rails.application.routes.draw do
  get 'reviews/create'

  devise_for :users
  resources :users, except: [:new, :create]
  resources :products do
    post '/reviews', to: 'reviews#create'
  end
  resources :carts, only: :show

  get '/users/:id/user_shop', to: 'users#user_shop', as: 'user_shop'
  post '/baskets', to: 'baskets#create'
  patch '/baskets', to: 'baskets#update'
  put '/baskets', to: 'baskets#update'
  delete '/baskets', to: 'baskets#destroy'

  root 'products#home'
end
