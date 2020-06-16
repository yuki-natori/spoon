class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                                   null: false, index: true
      t.integer :price,                                              null: false
      t.text :description,                                           null: false
      t.integer :condition
      # t.integer :shipping_fee,                                       null: false
      t.integer :shipping_from,                                      null: false
      t.integer :days_before_shipping,                               null: false
      t.integer :shipping_method,                                    null: false
      # t.integer :status,                                             null: false
      t.integer :brand
      t.integer :category
      t.references :user,            null: false, index: true, foreign_key: true
      # t.references :size,            null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
