Rails.application.routes.draw do
  mount Root => "/"
  mount GrapeSwaggerRails::Engine => "/swagger"
  mount School::V1::Base => '/api'

  get "/login", to: "sessions#index"
  match "/login", to: "sessions#login", via: [:get, :post]
  match "/create", to: "sessions#create", via: [:get, :post]
  get "/signup", to: "sessions#signup"
  get "homepage/index", to: "homepage#index"
  resources :students
  resources :quizzes
  resources :teams, except: [:index, :show]
  resources :courses

  resources :dashboard, format: [:html, :js]
  get "teams/index", to: "teams#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#body"
end
