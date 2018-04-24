Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/sign_up", to: "devise/registrations#new"
    post "/sign_up", to: "devise/registrations#create"
    get "/sign_in",   to: "devise/sessions#new"
    post "/sign_in",   to: "devise/sessions#create"
  end
  root "static_pages#home", page: "home"
  get "/about" => "static_pages#about"
  get "/contact" => "static_pages#contact"
end
