require 'rails_helper'

describe Importer do
  let(:csv){ fixture_file_upload('import_test.csv') }

  let(:inventory) { create(:inventory) }

  describe 'creation' do
    it 'is created with a file and inventory' do
      importer = described_class.new(csv, inventory)

      expect(importer).to be_an(Importer)
    end
  end

  describe 'attributes' do
    let(:importer) { described_class.new(csv, inventory) }

    it 'has unique count' do
      expect(importer.unique).to eq(0)
    end

    it 'has failed count' do
      expect(importer.failed).to eq(0)
    end

    it 'has total count' do
      expect(importer.total).to eq(0)
    end
  end

  describe 'instance methods' do
    let(:importer) { described_class.new(csv, inventory) }

    describe '#load' do
      it 'loads a csv into an inventory' do
        c1 = Card.create(name: "Jace's Sanctum")
        c2 = Card.create(name: "Oath of Jace")
        c3 = Card.create(name: "Food Chain")

        importer.load

        expect(importer.unique).to eq(3)
        expect(importer.total).to eq(16)
        expect(importer.failed).to eq(6)
        expect(inventory.cards.size).to eq(3)
        expect(inventory.quantity(c1)).to eq(3)
        expect(inventory.quantity(c3)).to eq(11)
      end

      it 'adds existing cards' do
        c1 = Card.create(name: "Jace's Sanctum")
        c2 = Card.create(name: "Oath of Jace")
        c3 = Card.create(name: "Food Chain")

        importer.load
        importer.load
      
        expect(importer.unique).to eq(0)
        expect(importer.failed).to eq(6)
        expect(importer.total).to eq(16)
      end
    end
  end
end
