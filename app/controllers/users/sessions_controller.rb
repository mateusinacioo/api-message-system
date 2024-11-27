class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:user][:email])

    if user && !user.status 
      flash[:alert] = "Conta inativa. Contate o administrador."
      redirect_to new_user_session_path
    else
      super
    end
  end
end