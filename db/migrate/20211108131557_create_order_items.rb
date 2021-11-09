class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.integer :quantity
      t.timestamps
    end
  end
end
