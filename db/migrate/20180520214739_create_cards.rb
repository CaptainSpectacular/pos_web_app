class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
