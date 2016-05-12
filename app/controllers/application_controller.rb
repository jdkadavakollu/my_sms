class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  add_breadcrumb 'Home', :home_index_path
  before_action :add_default_breadcrumb

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_path, alert: exception.message
  end

  def self.controller_name
    self.to_s.split(':').last.gsub('Controller', '')
  end

  def add_default_breadcrumb
    return if request.xhr? # we don't need breadcrumbs for ajax requests
    lowercase_controller_name = controller_name.underscore
    #If it is the home controller, its breadcrumb has already been added by ApplicationController
    return if lowercase_controller_name == 'home'
    path = :"#{lowercase_controller_name}_path"
    add_breadcrumb controller_name.underscore.humanize, path
  end

  protected

  def configure_permitted_parameters
    # Fields for sign up
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :phone_number) }
    # Fields for editing an existing account
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password) }
  end
end
