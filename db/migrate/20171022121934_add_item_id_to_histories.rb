class AddItemIdToHistories < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :item_id, :string
  end
end
