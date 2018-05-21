class Inventory < ApplicationRecord
  has_many :inventory_cards
  has_many :cards, through: :inventory_cards
end
