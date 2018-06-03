class ChargesController < ApplicationController
  before_action :validate_total, only: [:create]
  before_action :set_customer_and_charge, only: [:create]
  after_action :reset_total, only: [:create]

  def new
  end

  def create
    redirect_to pos_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to pos_path 
  end

  private

  def validate_total
    return redirect_to new_charge_path if current_total <= 0
  end
  
  def reset_total
    session[:current_transaction] = Hash.new 
  end

  def set_customer_and_charge
    customer = Stripe::Customer.create(email: params[:stripeemail],
                                       source: params[:stripeToken])
    charge = Stripe::Charge.create( customer: customer.id,
                                    amount: (current_total * 100).to_i,
                                    description: 'Mock Stripe Customer',
                                    currency: 'usd')
  end
end
