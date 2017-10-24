class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :image
      t.integer :category
      t.references :user, foreign_key: true
      t.integer :price
      t.string :name
      t.string :content
      t.integer :view
      t.integer :type
      t.timestamps :bought_date

      t.timestamps
    end
  end
end
