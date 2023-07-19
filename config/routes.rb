Rails.application.routes.draw do
  devise_for :users
  resources :users


  resources :courses do
    collection do
      get 'load_courses'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/fetch_courses', to: 'courses#fetch_courses'
  get '/courses', to: 'courses#index'

  patch '/admin/approve_user/:id', to: 'users/admin#approve_user', as: :admin_approve_user
  get '/approval', to: 'users/admin#approval_page', as: :approval_page

  # Defines the root path route ("/")
  root 'home#index'
end
