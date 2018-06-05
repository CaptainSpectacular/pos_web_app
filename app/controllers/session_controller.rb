class SessionController < Devise::SessionsController
  after_action :set_transaction, only: [:create]

  private

  def set_transaction
    session[:current_transaction] = Hash.new 
  end
end
