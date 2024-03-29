class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!, unless: :api_path

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def api_path
    request.original_url.include?("api")
  end
end
