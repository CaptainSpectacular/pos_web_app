class AddQuantityToInventoryCards < ActiveRecord::Migration[5.1]
  def change
    add_column :inventory_cards, :quantity, :integer, default: 0
  end
end
