class RemoveItemIdToHistories < ActiveRecord::Migration[5.0]
  def change
    remove_column :histories, :item_id, :string
  end
end
