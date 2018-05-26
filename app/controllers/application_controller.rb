class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_inventory
    @current_inventory ||= current_user.inventory
  end
end
