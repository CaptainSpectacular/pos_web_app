require 'spec_helper'

describe TCGPlayerService do
  let(:service) { described_class.new }

  describe 'instance methods' do
    describe '#card_info' do
      it 'makes an api call and returns card information' do
        VCR.use_cassette('card_information') do
          expected = service.card_info('Dream Halls')
          condition = expected[:results].first[:productConditions].first
          
          expect(expected[:success]).to be_truthy
          expect(expected[:results].first[:productName]).to eq('Dream Halls')
          expect(expected[:results].first).to include(:image)
          expect(condition[:name]).to eq('Near Mint')
          expect(condition[:productConditionId]).to eq(18844)
        end
      end
    end

    describe '#get_price' do
      it 'returns pricing information of a condition id' do
        VCR.use_cassette('card_pricing') do
          expected = service.get_price(18844)

          expect(expected[:success]).to be_truthy
          expect(expected[:results].first[:price]).to_not be_nil
        end
      end
    end
  end
end
