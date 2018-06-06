require 'csv'

class Importer
  attr_reader :unique, :total, :failed

  def initialize(file, inventory)
    @file      = file.tempfile
    @inventory = inventory
    @unique    = 0
    @total     = 0
    @failed    = 0
  end

  def load
    CSV.foreach(@file, headers: true, header_converters: :symbol) do |row|
      card = Card.find_by(name: row[:name])
      unless card
        @failed += 1
        next
      end
      @unique += 1 unless @inventory.cards.find_by(name: row[:name])
      @inventory.add_card(card, row[:quantity].to_i)
      @total  += row[:quantity].to_i
    end
  end
end
