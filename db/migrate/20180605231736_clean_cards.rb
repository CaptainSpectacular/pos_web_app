class CleanCards < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :price
    remove_column :cards, :condition_id
  end
end
