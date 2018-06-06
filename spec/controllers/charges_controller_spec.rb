require 'rails_helper'

describe ChargesController, type: :controller do
  describe 'GET new' do
    it 'is a successfull response' do
      session[:current_transaction] = {}
      get :new

      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:inventory) { create(:inventory) }
    let(:stripe_helper) { StripeMock.create_test_helper }
    before { StripeMock.start }
    after  { StripeMock.stop }

    it 'clears the transaction' do
      user = inventory.user
      customer = Stripe::Customer.create({
        email: user.email,
        source: stripe_helper.generate_card_token
      })
      post :create

      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_charge_path)
    end
  end
end
