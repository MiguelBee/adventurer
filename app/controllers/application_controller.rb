class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = %i[first_name last_name password quote birthday password_confirmation current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
