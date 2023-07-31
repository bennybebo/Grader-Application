Rails.application.routes.draw do
  get 'recommendations/new'
  get 'recommendations/create'
  devise_for :users
  resources :users


  resources :courses do
    collection do
      get 'load_courses'
      delete :delete_all_courses
    end
  end
  resources :recommendations, only: [:new, :create]
  resources :sections, only: [:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/fetch_courses', to: 'courses#fetch_courses'
  get '/courses', to: 'courses#index'
  get '/reload_courses_form', to: 'courses#reload_courses_form', as: :reload_courses_form

  patch '/admin/approve_user/:id', to: 'users/admin#approve_user', as: :admin_approve_user
  get '/approval', to: 'users/admin#approval_page', as: :approval_page
  get '/grader_assignment', to: 'users/admin#grader_assignment_page', as: :grader_assignment_page
  # Defines the root path route ("/")
  root 'home#index'

  # get '/apply/:section_id', to: 'grader_apply#apply', as: 'apply'
  # get '/apply/:section_id', to: 'grader_apply#new', as: 'new_grader_application'
  post '/apply/:section_id', to: 'grader_apply#create', as: 'create_grader_application'
  resources :grader_apply, only: [:new, :create], param: :section_id, path: 'apply', as: 'grader_application'

end
