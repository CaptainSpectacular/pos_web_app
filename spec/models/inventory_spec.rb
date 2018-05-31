require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:inventory_cards) }
    it { is_expected.to have_many(:cards).through(:inventory_cards) }
  end

  describe 'instance methods' do
    let(:inventory) { create(:inventory) }
    let(:card) { create(:card) }
    let(:card_2) { create(:card, name: 'Dream Halls') }
    describe '#add_card' do
      it 'adds a card to an inventory with a quantity of x' do
        inventory.add_card(card, 1)

        expect(inventory.cards.size).to eq(1)

        # It doesn't add duplicates

        inventory.add_card(card, 1)

        expect(inventory.cards.size).to eq(1)

        # It adds unique cards 

        inventory.add_card(card_2, 10)

        expect(inventory.cards.size).to eq(2)
      end
    end

    describe '#quantity' do
      it 'returns the quantity of a given card' do
        inventory.add_card(card, 20)

        expect(inventory.quantity(card)).to eq(20)
        expect(inventory.quantity(card_2)).to eq(0)
      end
    end
  end
end
