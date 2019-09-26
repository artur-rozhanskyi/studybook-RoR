class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for
    current_user.admin? ? admin_welcome_index_path : search_path
  end

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |action|
      devise_parameter_sanitizer.permit(action, keys: [:name, :last_name, :email, :password, :password_confirmation])
    end
  end
end
