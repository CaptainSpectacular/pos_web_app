class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.where(user: current_user)
  end

  def browse
    @inventories = Inventory.all
  end

  def show
    @presenter = InventoryPresenter.new(Inventory.find(id))
  end

  def new
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
end