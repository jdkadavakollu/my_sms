class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    # Fields for sign up
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :phone_number) }
    # Fields for editing an existing account
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password) }
  end
end
