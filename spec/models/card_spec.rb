require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:inventory_cards) }
    it { is_expected.to have_many(:inventories).through(:inventory_cards) }
  end
end
