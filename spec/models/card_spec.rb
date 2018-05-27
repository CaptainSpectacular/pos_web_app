require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:inventory_cards) }
    it { is_expected.to have_many(:inventories).through(:inventory_cards) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'class methods' do
    describe '.create_from_api' do
      let(:service) { TCGPlayerService.new }

      it 'creates a card from an api call' do
        VCR.use_cassette('card_information') do
          expect(Card.all.size).to eq(0)

          params = service.card_info('Dream Halls')
          Card.create_from_api(params)

          expect(Card.all.size).to eq(1)
          expect(Card.first.name).to eq('Dream Halls')
          expect(Card.first.condition_id).to_not be_nil
        end
      end
    end
  end
end
