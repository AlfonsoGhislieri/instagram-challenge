Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments do 
      resources :likes
    end
  end
end
