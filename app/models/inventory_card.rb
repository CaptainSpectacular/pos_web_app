class InventoryCard < ApplicationRecord
  belongs_to :card
  belongs_to :inventory
end
