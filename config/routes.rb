DeviseExample::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end
  resources :users do
    member do
      get "profile"
    end
 	  resources :friendships
 	  resources :groups
 	  resources :statuses do
      resources :like_statuses
      resources :comments do
        resources :like_comments
      end
    end
  end
end
