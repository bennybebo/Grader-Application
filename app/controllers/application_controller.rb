class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password, :remember_me])
    end  

    def after_sign_in_path_for(resource)
      super
    end

end