DeviseExample::Application.routes.draw do

  devise_for :models
  devise_for :users

  get '/token' => 'home#token', as: :token

  resources :home, only: :index

  root 'home#index'

end
