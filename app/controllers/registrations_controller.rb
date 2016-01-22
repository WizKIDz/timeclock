class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:username, :password, :password_confirmation, :admin, :projects)
  end

  def account_update_params
    params.require(:user).permit(:username, :password, :password_confirmation, :current_password, :admin, :projects)
  end
end