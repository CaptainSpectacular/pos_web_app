class CardsController < ApplicationController
  before_action :set_card, only: :show
  before_action :search, only: :index

  def index
    @cards.paginate(page: params[:page], per_page: 25)
  end

  def show
    @presenter = CardPresenter.new(@card)
  end

  private
    
  def set_card
    @card = Card.find_by(name: params[:slug])
  end

  def search
    @cards = Card.where("name LIKE '%#{params[:q]}%'")
  end
end
