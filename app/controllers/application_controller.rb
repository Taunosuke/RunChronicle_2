class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  private
  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :email ])
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :password ])
  end
end
