class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: :update

  def index
    @inventories = Inventory.where(user: current_user)
  end

  def browse
    @inventories = Inventory.all
  end

  def show
    @presenter = InventoryPresenter.new(Inventory.find(params[:id]))
  end

  def new
  end

  def update
    current_inventory.add_card(@card, params[:quantity][:integer]) 
    
    redirect_back(fallback_location: { controller: 'cards', action: 'index' })
  end

  def create
    inventory = Inventory.new(inventory_params)
    inventory.user = current_user
    inventory.save!

    redirect_to(inventories_path)
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end

  def set_card
    @card = Card.find_by(name: params[:card])
  end
end
