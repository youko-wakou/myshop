class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.integer :item_id

      t.timestamps
      t.index [:user_id,:item_id],unique: true
    end
  end
end
