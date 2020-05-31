class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :body
      t.integer :phone_number,unique: true
      t.integer :zipcode
      t.integer :prefecture
      t.string :city
      t.string :block
      t.string :building
      t.references :user,  null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
