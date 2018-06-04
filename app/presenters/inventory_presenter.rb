class InventoryPresenter
  def initialize(inventory)
    @inventory = inventory
  end

  def total_items
    @inventory.total_items
  end

  def name
    @inventory.name
  end

  def user 
    @inventory.user.email
  end
end
