class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, 
  if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { 
      |u| u.permit(:email, :password, :password_confirmation,:username) 
    }

    devise_parameter_sanitizer.permit(:account_update) { 
      |u| u.permit(:avatar, :email, :password, :password_confirmation, :current_password, :username) 
    } 
  end
end
