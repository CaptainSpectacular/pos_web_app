class CardsController < ApplicationController
  before_action :set_card, only: :show

  def index
    @cards = Card.paginate(page: params[:page], per_page: 25)
  end

  def show
    @presenter = CardPresenter.new(@card)
  end

  private
    
  def set_card
    @card = Card.find_by(name: params[:slug])
  end
end
