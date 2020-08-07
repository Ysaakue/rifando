class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    @error_message = exception.message
    render json:{
      status: "error",
      "data": @error_message
    }, status: 401
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email, :password]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :email, :password, :current_password] 
  end
end
