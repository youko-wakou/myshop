class RemoveViewFromShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :shopping_carts, :view, :integer
  end
end
