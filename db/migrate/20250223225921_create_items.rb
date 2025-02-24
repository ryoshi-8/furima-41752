class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string  :product_name,       null: false
      t.text    :description,        null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :ship_fee_burden_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :days_until_ship_id, null: false
      t.integer :price,              null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
