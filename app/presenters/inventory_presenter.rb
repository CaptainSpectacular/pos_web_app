class InventoryPresenter
  attr_reader :name, :user

  def initialize(inventory)
    @name = inventory.name
    @user = inventory.user
  end
end