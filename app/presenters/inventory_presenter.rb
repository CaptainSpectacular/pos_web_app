class InventoryPresenter
  attr_reader :name, :user

  def initialize(inventory)
    @name = inventory.name
    @user = inventory.user
    @inventory = inventory
  end

  def total_items
    @inventory.total_items
  end
end
