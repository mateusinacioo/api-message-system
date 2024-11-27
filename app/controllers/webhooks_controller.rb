class WebhooksController < ApplicationController
  before_action :authenticate_with_token, only: [:create, :update]
  protect_from_forgery with: :null_session

  def create
    user_data = params.require(:user).permit(:email, :full_name, :birth_date, :cpf, :status)
    user_data[:status] = user_data[:status].nil? ? true : user_data[:status]
    password = SecureRandom.hex(8)
    user_data[:password] = password
    user = User.new(user_data)

    if user.save
      render json: { message: 'Usuário criado com sucesso!', password: password }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
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

  private 

  def authenticate_with_token
    token = request.headers["Authorization"]&.split(" ")&.last
    if token != ENV["API_AUTH_TOKEN"]
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

end