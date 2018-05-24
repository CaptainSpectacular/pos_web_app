class AddDescriptionAndConditionIdToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :description, :text
    add_column :cards, :condition_id, :string
    add_column :cards, :image, :string
  end
end
