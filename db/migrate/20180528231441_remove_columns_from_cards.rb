class RemoveColumnsFromCards < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :image
    remove_column :cards, :image_url
    remove_column :cards, :created_at
    remove_column :cards, :updated_at
  end
end
