require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:inventory_cards) }
    it { is_expected.to have_many(:inventories).through(:inventory_cards) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'instance methods' do
    let(:card) { create(:card) }

    describe '#price' do
      it 'returns the price of a card' do
        VCR.use_cassette('card_pricing') do
          expect(card.price.to_s).to match(/\d*.\d\d/)
        end
      end
    end

    describe '#image' do
      it 'returns an image url for the card' do
        VCR.use_cassette('card_pricing') do
          expected = "https://6d4be195623157e28848-7697ece4918e0a73861de0eb37d08968.ssl.cf1.rackcdn.com/6529_200w.jpg"
          expect(card.image).to eq(expected)
        end
      end
    end
  end

  describe 'class methods' do
    describe '.like' do
      before(:each) do
        @card1 = described_class.create(name: 'Food Chain')
        @card2 = described_class.create(name: 'Bad Chainz')
        @card3 = described_class.create(name: 'Chain')
      end
      it 'returns cards where the name is similar to the query' do
        expect(Card.like('Foo')).to eq([@card1])
        expect(Card.like('Chain')).to eq([@card1, @card2, @card3])
        expect(Card.like('ad')).to eq([@card2])
      end
    end
  end
end
