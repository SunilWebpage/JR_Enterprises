Rails.application.routes.draw do
  root "users#login"
  get "users/index"
  resources :users, only: [ :index, :create, :edit, :update ]

get "profile/:id", to: "users#profile", as: :profile
get "admin", to: "users#admin"
get "login", to: "users#login"
post "login", to: "users#login_form"
delete "logout", to: "users#logout"


resources :products, only: [ :index, :create, :destroy, :show ]

get "products", to: "products#index"
get "items", to: "products#added_product"
get "home", to: "products#home"
get "productview/:id", to: "products#productview", as: :productview

post "cart/add/:id", to: "carts#add", as: :add_to_cart
get "cart", to: "carts#index"
delete "cart/remove/:id", to: "carts#destroy", as: :remove_from_cart



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
