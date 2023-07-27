Rails.application.routes.draw do
  mount Root => "/"
  mount GrapeSwaggerRails::Engine => "/swagger"
  mount School::V1::Base => '/api'

  get "/index", to: "sessions#index"
  match "/login", to: "sessions#login", via: [:get, :post]
  match "/create", to: "sessions#create", via: [:get, :post]
  get "/signup", to: "sessions#signup"
  get "/home", to: "sessions#homepage"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
