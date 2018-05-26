class CardPresenter
  def initialize(card)
    @card    = card
    @service = TCGPlayerService.new
  end

  def name
    @card.name
  end

  def image
    @card.image_url
  end

  def price
    @price ||= @card.price
    "%.2f"% @price
  end
end
