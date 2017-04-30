Rails.application.routes.draw do
  root 'pages#home'

  get  "/login"   => "sessions#new",     as: "login"
  post "/login"   => "sessions#create"
  get  "/logout"  => "sessions#destroy", as: "logout"

  resources :users
  get "/signup" => "users#new", as: "signup"

  resources :courses do
    get "forbidden" => "courses#forbidden"
  end

  resources :locations
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
