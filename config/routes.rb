Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/sign_up", to: "devise/registrations#new"
    post "/sign_up", to: "devise/registrations#create"
    get "/sign_in", to: "devise/sessions#new"
    post "/sign_in", to: "devise/sessions#create"
    get "/sign_out", to: "devise/sessions#destroy"
  end
  root "static_pages#home", p: "home"
  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"
  get "/contact" => "static_pages#contact"
  resources :categories
  resources :authors
  resources :bills
  resources :books do
    resources :comments
  end
  resource :cart
  resource :checkout

  namespace :admin do
    resources :authors
    resources :categories
    resources :books
    resources :bills
    resources :users
  end
  get "admin", to: "admin/static_pages#index"
end
