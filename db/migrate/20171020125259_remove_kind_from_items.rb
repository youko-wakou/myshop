class RemoveKindFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :kind, :integer
  end
end
