class AddItemToShoppingCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_carts, :item, index: true
  end
end
