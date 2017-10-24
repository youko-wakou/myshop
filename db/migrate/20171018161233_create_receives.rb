class CreateReceives < ActiveRecord::Migration[5.0]
  def change
    create_table :receives do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.integer :message_id
      t.string :title

      t.timestamps
    end
  end
end
