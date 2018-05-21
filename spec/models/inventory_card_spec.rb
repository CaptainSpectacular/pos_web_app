require 'rails_helper'

RSpec.describe InventoryCard, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:card) }
    it { is_expected.to belong_to(:inventory) }
  end
end
