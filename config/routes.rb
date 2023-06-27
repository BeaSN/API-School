Rails.application.routes.draw do
  mount Root => "/"
  mount GrapeSwaggerRails::Engine => "/swagger"

  get "/index", to: "sessions#index"
  match "/login", to: "sessions#login", via: [:get, :post]
  get "/signup", to: "sessions#create"
  get "/home", to: "sessions#homepage"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
