Rails.application.routes.draw do
  root "home#index"

  get "/signup", to: "users#new", as: "signup"
  post "/users", to: "users#create"
  delete "/users/:id", to: "users#destroy", as: "user"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :categories
  resources :todos do
    collection do
      get :completed
    end
  end
end