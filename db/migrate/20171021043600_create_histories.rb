class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.references :user
      t.references :item
      t.integer :total

      t.timestamps
    end
  end
end
