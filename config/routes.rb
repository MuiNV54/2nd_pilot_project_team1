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
    collection do
      get :search_auto
    end
 	  resources :friendships
 	  resources :groups
 	  resources :statuses do
      resources :comments
      resources :shares
    end
  end
  resources :like_statuses do
    collection do
      get :like_or_unlike
    end
  end
  resources :like_comments do
    collection do
      get :like_or_unlike
    end
  end
end