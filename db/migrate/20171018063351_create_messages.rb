class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.integer :select_user
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
