class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :price
      t.string :sku
      t.integer :stock
      t.references :region, foreign_key: true, index: true
 
      t.timestamps
    end
  end
end
