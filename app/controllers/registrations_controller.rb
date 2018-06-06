class RegistrationsController < Devise::RegistrationsController
  before_action :set_transaction, only: [:create]
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :company)
  end

  def set_transaction
    session[:current_transaction] = Hash.new
  end
end
