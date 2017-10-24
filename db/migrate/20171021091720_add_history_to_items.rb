class AddHistoryToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :history, :integer
  end
end
