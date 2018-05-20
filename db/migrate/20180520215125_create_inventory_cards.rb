class CreateInventoryCards < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_cards do |t|
      t.references :inventory, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
