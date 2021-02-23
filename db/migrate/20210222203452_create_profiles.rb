class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :users, null: false, foreign_key: true
      t.string :photo 

      t.timestamps
    end
  end
end
