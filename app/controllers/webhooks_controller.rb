class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session

  def create_users
    user_data = params.require(:user).permit(:email, :full_name, :birth_date, :cpf, :status)
    password = SecureRandom.hex(8)
    user_data[:password] = password
    user = User.new(user_data)

    if user.save
      render json: { message: 'Usuário criado com sucesso!', password: password }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_users
    user = User.find_by(id: params[:id])

    if user.nil?
      render json: { error: 'Usuário não encontrado, informe um ID válido na URL!'}, status: :not_found
      return
    end

    new_user_data = params.require(:user).permit(:email, :full_name, :birth_date, :cpf, :status)

    if user.update(new_user_data)
      render json: { message: 'Usuário atualizado com sucesso!' }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end