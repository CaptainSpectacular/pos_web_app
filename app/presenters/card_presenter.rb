class CardPresenter
  def initialize(card)
    @card    = card
  end

  def name
    @card.name
  end

  def image
    @image ||= @card.image
  end

  def price
    @price ||= @card.price
  end
end
