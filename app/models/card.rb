class Card < ApplicationRecord
  has_many :inventory_cards
  has_many :inventories, through: :inventory_cards

  validates :name, presence: true

  def to_param
    name
  end

  def self.create_from_api(params)
    create(parameterize(params)) 
  end

  def price
    service = TCGPlayerService.new
    price = service.get_price(condition_id)
    price[:results][0][:price]
  end

  private

  def self.parameterize(params)
    { name:         params[:results].first[:productName],
      image_url:    params[:results].first[:image],
      condition_id: params[:results].first[:productConditions].first[:productConditionId]
    }
  end
end
