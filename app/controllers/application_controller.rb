class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_inventory

  def current_inventory
    @current_inventory ||= current_user.inventories.first
  end
end
