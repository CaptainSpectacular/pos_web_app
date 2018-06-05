class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_inventory
  helper_method :current_total

  def current_inventory
    @current_inventory ||= current_user.inventories.first
  end

  def current_total
    return 0 unless session[:current_transaction]
    session[:current_transaction].map do |k, v|
      Card.find_by(name: k).price * v
    end.sum
  end
end
