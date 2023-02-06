Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "authors#index"

  get "/authors", to: "authors#index"
  get "/books", to: "books#index"

  resources :authors do
    resources :books
  end

  resources :books #do
  #resources :authors
  #end
end
