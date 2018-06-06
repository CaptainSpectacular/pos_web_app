require 'rails_helper'

describe ChargeMaster do
  let(:inventory) { create(:inventory) }
  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after  { StripeMock.stop }

  describe 'instance methods' do
    describe '#charge' do
      it 'creates a charge' do
        user = inventory.user
        cm = ChargeMaster.new({}, 2333)
         customer = Stripe::Customer.create({
           email: user.email,
           source: stripe_helper.generate_card_token})

        allow_any_instance_of(ChargeMaster).to receive(:customer).and_return(customer)

        expect(cm.charge).to_not(be_nil)
      end
    end
  end
end
