Rails.application.routes.draw do
  root to: "posts#index"
  resources :comments
  resources :categories do
    resources :posts
  end
end
