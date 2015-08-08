class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).concat [:first_name, :last_name]
    devise_parameter_sanitizer.for(:sign_up).concat [:first_name, :last_name]
    devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name]
  end
end
