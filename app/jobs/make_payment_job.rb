class MakePaymentJob < ApplicationJob
  queue_as :default

  def perform(order)
    if order.order_fullfillable?
      order.order_items.each do |item|
        product = item.product 
        stock_available = product.stock - item.quantity
        product.update(stock: stock_available)
      end
      order.update(status: 'paid', paid_at: Time.now)
    else
      order.update(status: 'cancelled')
    end
  end
end
