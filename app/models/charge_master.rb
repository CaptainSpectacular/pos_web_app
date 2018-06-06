class ChargeMaster
  def initialize(params, total)
    @auth_token = params[:authenticity_token]
    @s_token    = params[:stripeToken]
    @s_email    = params[:stripeEmail]
    @s_type     = params[:stripeTokenType]
    @total      = total
  end

  def customer
    @customer ||= Stripe::Customer.create(email: @s_email,
                                          source: @s_token)
  end

  def charge
    @charge ||= Stripe::Charge.create( customer: customer.id,
                                       amount: (@total * 100).to_i,
                                       description: 'Mock Stripe Customer',
                                       currency: 'usd')
 
  end
end
