class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      # t.integer :authorization_code, null: false, unique: true
      # t.integer :security_code,      null: false
      # t.integer :manth,              null: false
      # t.integer :year,               null: false
      # t.references :user,            null: false, index: true, foreign_key: true
      # t.integer :user_id,    null: false
      # t.string :customer_id, null: false
      # t.string :card_id,     null: false
      t.timestamps
    end
  end
end
