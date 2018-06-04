require 'spec_helper'

describe TCGPlayerService do
  let(:service) { described_class.new }

  describe 'instance methods' do
    describe '#card_info' do
      it 'makes an api call and returns card information' do
        VCR.use_cassette('card_information') do
          expected = service.get_info('Dream Halls')

          expect(expected[:name]).to eq('Dream Halls')
          expect(expected[:image]).to_not be_nil 
          expect(expected[:price]).to_not be_nil 
        end
      end
    end
  end
end
