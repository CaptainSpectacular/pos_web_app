class Card < ApplicationRecord
  has_many :inventory_cards
  has_many :inventories, through: :inventory_cards

  validates :name, presence: true
end
