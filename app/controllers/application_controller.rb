class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
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

end
