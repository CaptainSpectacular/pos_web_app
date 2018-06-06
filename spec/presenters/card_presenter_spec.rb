require 'rails_helper'

describe CardPresenter do
  let(:card) { create(:card) }

  describe 'creation' do
    it 'is created with a card' do
      presenter = CardPresenter.new(card)

      expect(presenter).to be_a(CardPresenter)
    end
  end

  describe 'instance methods' do
    let(:presenter) { described_class.new(card) }
    describe '#name' do
      it 'returns the card name' do
        expect(presenter.name).to eq(card.name) 
      end
    end

    describe '#image' do
      it 'returns the cards image url' do
        VCR.use_cassette('card_pricing') do
          VCR.use_cassette('card_info') do
            expect(presenter.image).to eq(card.image)
          end
        end
      end
    end

    describe '#price' do
      it 'returns the card price' do
        VCR.use_cassette('card_pricing') do
          VCR.use_cassette('card_info') do
            expect(presenter.price).to eq(card.price)
          end
        end
      end
    end
  end
end
