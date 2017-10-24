class RemoveItemIdFromShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :shopping_carts, :item_id, :integer
  end
end
