class Users::SessionsController < Devise::SessionsController
  # Sobrescreve o método create do Devise
  def create
    user = User.find_by(email: params[:user][:email])

    if user && !user.status  # Verifica se o usuário está inativo
      flash[:alert] = "Conta inativa. Contate o administrador."
      redirect_to new_user_session_path
    else
      super  # Chama o método original do Devise para autenticação
    end
  end
end
