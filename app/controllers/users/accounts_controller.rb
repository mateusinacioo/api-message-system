class Users::AccountsController < Devise::RegistrationsController
  def new
      redirect_to authenticated_root_path
  end

  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      # Atualiza o campo password_changed somente se a senha foi alterada
      resource.password_changed = true
    end
    super
  end
end
