Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/fetch_courses', to: 'courses#fetch_courses'
  get '/courses', to: 'courses#index'
  # Defines the root path route ("/")
  root 'home#index'
end
