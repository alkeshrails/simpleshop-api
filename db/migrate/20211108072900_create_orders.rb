class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.text :shipping_address
      t.decimal :order_total
      t.datetime :paid_at

      t.timestamps
    end
  end
end
