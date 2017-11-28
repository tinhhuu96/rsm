class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @error_message = exception.model
    respond_to do |f|
      f.js{render "errors/error", status: 401}
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name phone address sex birthday))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name phone address sex birthday))
  end
end
