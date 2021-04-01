Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :posts, only: [:index, :show]
  resources :items, only: [:index, :show]
  # resources :projects
  namespace :admin do
    root to: "dashboard#admin"
    resources :items
    resources :orders
    resources :posts
    # resources :projects do
    #   get "/publish", to: "projects#publish"
    #   get "/unpublish", to: "projects#unpublish"
    # end
    resources :users do
      get "/activate", to: "users#activate"
      get "/deactivate", to: "users#deactivate"
    end
  end

  namespace :app do
    root to: "dashboard#app"
  end
end
