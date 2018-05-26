class CardsController < ApplicationController
  def index
    @cards = Card.pluck(:name)
  end

  def show
    @presenter = CardPresenter.new(Card.find_by(name: params[:slug]))
  end
end
