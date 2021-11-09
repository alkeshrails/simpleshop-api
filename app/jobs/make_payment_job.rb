class MakePaymentJob < ApplicationJob
  queue_as :default

  def perform(order)
    status = ['cancelled', 'paid'].sample
    order.update(status: status)
    order.update(paid_at: Time.now) if order.paid?
  end
end
