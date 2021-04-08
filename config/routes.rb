Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :posts, only: [:index, :show]
  resources :items, only: [:index, :show]
  # resources :projects
  namespace :admin do
    root to: "dashboard#admin"
    resources :items do
      get "/publish", to: "items#publish"
      get "/unpublish", to: "items#unpublish"
    end
    resources :orders do
      get "/mark-as-sent", to: "orders#mark_as_sent"
    end
    resources :posts do
      get "/publish", to: "posts#publish"
      get "/unpublish", to: "posts#unpublish"
    end
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
