class AddUserToInventories < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :user
  end
end
