Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :projects
  
  namespace :blog do
    root to: "posts#index", as: "posts"
    get "/:id", to: "posts#show", as: "post"
  end
  
  namespace :admin do
    root to: "dashboard#home"
    resources :posts
    resources :projects do
      get "/publish", to: "projects#publish"
      get "/unpublish", to: "projects#unpublish"
    end
    resources :users
  end
end
