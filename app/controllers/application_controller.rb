class ApplicationController < ActionController::Base

  GIT_SHA ||= `git rev-parse HEAD`.chomp

  protect_from_forgery with: :exception
  respond_to :html, :json

  # Work around problem witb RAILS 4 and CANCAN resource loading
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter do
    headers['X-GitSHA'] = GIT_SHA
    @git_sha = GIT_SHA
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :remember_me, :password, :password_confirmation, :name )
    end
  end

  def record_not_found
    render :nothing => true, :status => 404
  end

end
