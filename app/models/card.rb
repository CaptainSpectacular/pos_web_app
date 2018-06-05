class Card < ApplicationRecord
  has_many :inventory_cards
  has_many :inventories, through: :inventory_cards

  validates :name, presence: true

  def self.like(params)
    where("name LIKE '%#{params}%'")
  end

  def to_param
    name
  end

  def price
    info = service.get_info(name)
    info[:price]
  end

  def image
    info = service.get_info(name)
    info[:image]
  end

  private

  def service
    TCGPlayerService.new
  end
end
