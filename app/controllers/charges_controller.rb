class ChargesController < ApplicationController
  before_action :validate_total, only: [:create]
  before_action :set_charge_master
  after_action :reset_total, only: [:create]

  def new
  end

  def create
    update_inventory
    @charge_master.customer
    @charge_master.charge

    redirect_to pos_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to pos_path 
  end

  private

  def update_inventory
    session[:current_transaction].map do |k, v|
      current_inventory.remove_card(k, v)
    end
  end

  def validate_total
    return redirect_to new_charge_path if current_total <= 0
  end
  
  def reset_total
    session[:current_transaction] = Hash.new 
  end

  def set_charge_master
    @charge_master ||= ChargeMaster.new(charge_params, current_total)
  end

  def charge_params
    params.permit(:authenticity_token, :stripeToken, :stripeTokenType, :stripeEmail) 
  end

end
