class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :force_password_change

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :birth_date, :cpf])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :birth_date, :cpf])
  end

  def force_password_change
    if user_signed_in? && !current_user.password_changed && request.path != edit_user_registration_path && action_name != 'update'
      redirect_to edit_user_registration_path, alert: 'Altere sua senha antes de navegar.'
    end
  end
end
