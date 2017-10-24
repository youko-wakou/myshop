class AddViewToShoppingCart < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_carts, :view, :integer
  end
end
