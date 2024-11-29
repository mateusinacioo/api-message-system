class Users::AccountsController < Devise::RegistrationsController
  def new
      redirect_to authenticated_root_path
  end
end
