DeviseExample::Application.routes.draw do
  get "status/new"
  devise_for :models
  devise_for :users

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :users
 	resources :statuses

  root "home#index"

  devise_scope :user do
  	get "sign_in", :to => "devise/sessions#new"
	end
end