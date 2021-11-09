class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :products
      t.belongs_to :orders
      t.timestamps
    end
  end
end
