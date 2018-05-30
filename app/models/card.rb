class Card < ApplicationRecord
  has_many :inventory_cards
  has_many :inventories, through: :inventory_cards

  validates :name, presence: true

  def to_param
    name
  end

  def price
    info = service.get_price(condition_id)
    info[:results][0][:price]
  end

  def image
    info = service.get_info(name)
    info[:results].first[:image]
  end

  def condition_id
    update(condition_id: set_con_id) unless self[:condition_id]
    self[:condition_id]
  end

  private

  def set_con_id
    info =  service.get_info(name)
    info[:results][0][:productConditions][0][:productConditionId]
  end

  def service
    TCGPlayerService.new
  end
end
