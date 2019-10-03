class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_raven_context

  protected

  def after_sign_in_path_for(_resource)
    current_user.admin? ? admin_welcome_index_path : search_path
  end

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |action|
      devise_parameter_sanitizer.permit(action, keys: [:name, :last_name, :email, :password, :password_confirmation])
    end
  end

  def set_raven_context
    Raven.user_context(id: current_user.id, ip_address: request.ip) if current_user
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
