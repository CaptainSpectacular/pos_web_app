class Card < ApplicationRecord
  has_many :inventory_cards
  has_many :inventories, through: :inventory_cards

  validates :name, presence: true

  def to_param
    name
  end

  def price
    info = service.get_price(con_id)
    info[:results][0][:price]
  end

  def image
    info = service.get_info(name)
    info[:results].first[:image]
  end

  private

  def con_id
    info           = service.get_info(name)
    condition_id ||= info[:results].first[:productConditions].first[:productConditionId]
    save
    condition_id
  end

  def service
    TCGPlayerService.new
  end
end
