class Card < ApplicationRecord
  has_many :inventory_cards
  has_many :inventories, through: :inventory_cards

  validates :name, presence: true

  def to_param
    name
  end

  def self.write_from_query(name)
    service = TCGPlayerService.new
    attrs = service.card_info(name)
    create(name: attrs[:results].first[:productName], 
           image_url: attrs[:results].first[:image],
           condition_id: attrs[:results].first[:productConditions].first[:productConditionId])
  end
end
