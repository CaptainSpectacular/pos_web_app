require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:inventory_cards) }
    it { is_expected.to have_many(:cards).through(:inventory_cards) }
  end
end
