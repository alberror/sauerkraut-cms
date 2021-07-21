Rails.application.routes.draw do
  root to: "pages#home"
  get "/contact", to: "pages#contact", as: "contact"
  devise_for :users
  resources :members, only: [:index], path: I18n.t('members', locale: :routes)
  resources :posts, only: [:index, :show], path: I18n.t('posts', locale: :routes)
  resources :projects, only: [:index, :show], path: I18n.t('projects', locale: :routes)

  namespace :admin do
    root to: "dashboard#admin"
    resources :comments, path: I18n.t('comments', locale: :routes) do
      get "/publish", to: "comments#publish"
      get "/unpublish", to: "comments#unpublish"
    end
    resources :members, path: I18n.t('members', locale: :routes)
    resources :posts, path: I18n.t('posts', locale: :routes) do
      get "/publish", to: "posts#publish"
      get "/unpublish", to: "posts#unpublish"
    end
    resources :projects, path: I18n.t('projects', locale: :routes) do
      get "/publish", to: "projects#publish"
      get "/unpublish", to: "projects#unpublish"
    end
    resources :users, path: I18n.t('users', locale: :routes) do
      get "/activate", to: "users#activate"
      get "/deactivate", to: "users#deactivate"
    end
  end

  namespace :portland do
    root to: "dashboard#portland"
  end
end
