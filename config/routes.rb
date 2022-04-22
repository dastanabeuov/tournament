Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tournaments#index"

  resources :tournaments do
    post :start, on: :member
  end

  resources :teams
end
