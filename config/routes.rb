Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tournaments#index"

  resources :tournaments

  post "tournaments#start", to: "tournaments/start"

  resources :teams
end
