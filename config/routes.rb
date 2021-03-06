DeviseExample::Application.routes.draw do
  root 'home#index'
  devise_for :users
  devise_scope :user do
    get "sign_up", to: "devise/registrations#new"
    get "sign_in", to: "devise/sessions#new"
  end
  resources :users do
    member do
      get "profile"
    end
    collection do
      get :search_auto
    end
    resources :albums do
      resources :images do
        resources :comment_images
      end
    end
    resources :activities
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
