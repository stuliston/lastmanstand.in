class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :json

  # Work around problem witb RAILS 4 and CANCAN resource loading
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    obvious_message = <<-ASCII
       $$$$$$\  $$\   $$\        $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$\  $$\
      $$  __$$\ $$ |  $$ |      $$  __$$\ $$$\  $$ |$$  __$$\ $$  __$$\ $$ |
      $$ /  $$ |$$ |  $$ |      $$ /  \__|$$$$\ $$ |$$ /  $$ |$$ |  $$ |$$ |
      $$ |  $$ |$$$$$$$$ |      \$$$$$$\  $$ $$\$$ |$$$$$$$$ |$$$$$$$  |$$ |
      $$ |  $$ |$$  __$$ |       \____$$\ $$ \$$$$ |$$  __$$ |$$  ____/ \__|
      $$ |  $$ |$$ |  $$ |      $$\   $$ |$$ |\$$$ |$$ |  $$ |$$ |
       $$$$$$  |$$ |  $$ |      \$$$$$$  |$$ | \$$ |$$ |  $$ |$$ |      $$\
       \______/ \__|  \__|       \______/ \__|  \__|\__|  \__|\__|      \__|
    ASCII
    Rails.logger.warn obvious_message

    redirect_to root_path, alert: exception.message
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :remember_me, :password, :password_confirmation, :name )
    end
  end

end
