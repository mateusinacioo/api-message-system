class WebhooksController < ApplicationController
  # Desabilita CSRF para webhooks
  protect_from_forgery with: :null_session

  def create_users
    # Dados recebidos no payload JSON
    user_data = params.require(:user).permit(:email, :password, :full_name, :birth_date, :cpf, :status)

    # Cria um novo usuário com os dados recebidos
    user = User.new(user_data)

    if user.save
      render json: { message: 'Usuário criado com sucesso!' }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end