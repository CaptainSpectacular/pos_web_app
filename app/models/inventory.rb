class Inventory < ApplicationRecord
  has_many :inventory_cards
  has_many :cards, through: :inventory_cards
  belongs_to :user

  validates :name, presence: true

  def add_card(card, quantity)
    return unless quantity && card
    cards << card unless cards.find_by(id: card.id)
    update_quantity(card, quantity)
    save
  end

  def total_items
    cards.map{ |card| quantity(card) }.sum
  end

  def quantity(card)
    cards = inventory_cards.find_by(card_id: card.id)
    cards ? cards.quantity : 0
  end

  private

  def update_quantity(card, quantity)
    inventory_card = inventory_cards.find_by(card_id: card.id)
    inventory_card.quantity += quantity.to_i
    inventory_card.save
  end
end
