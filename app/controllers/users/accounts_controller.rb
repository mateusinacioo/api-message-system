class Users::AccountsController < Devise::RegistrationsController

  def new
      redirect_to authenticated_root_path
  end

  def update_resource(resource, params)
    # Exige senha atual ao alterar a senha
    return super if params["password"]&.present?

    # Permite atualizar dados sem informar senha
    resource.update_without_password(params.except("current_password"))
  end

  protected

  def account_update_params
    params.require(:user).permit(:email, :full_name, :cpf, :birth_date, :password, :password_confirmation, :current_password)
  end
end
