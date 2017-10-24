class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :place
      t.string :hp
      t.string :twitter
      t.string :pr
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
