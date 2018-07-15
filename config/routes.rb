Rails.application.routes.draw do
  root to: "categories#index"
  resources :categories do
    resources :comments, module: :categories
    resources :posts do
      resources :comments, module: :posts
    end
  end
end
