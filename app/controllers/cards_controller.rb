class CardsController < ApplicationController
  before_action :set_card, only: :show

  def index
    @cards = Card.pluck(:name)
  end

  def show
    @presenter = CardPresenter.new(@card)
  end

  private
    
  def set_card
    @card = Card.find_by(name: params[:slug])
  end
end
