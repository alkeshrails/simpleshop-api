class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  enum status: { pending: 'pending', paid: 'paid',
                 unpaid: 'unpaid', cancelled: 'cancelled' }

  after_save :make_payment_task, if: :unpaid?

  def create_order_items(items = [])
    products = JSON.parse(items.gsub!(/([[:alpha:]]+):/, '"\1":')).map { |item| [ item["id"], item["qty"] ] }
    products.each do |p_id, p_qty|
      product = Product.find(p_id)
      OrderItem.create(quantity: p_qty, product_id: p_id, order_id: self.id)
    end
  end

  def fetch_total_price
    total = 0
    order_items.each do |item|
      total += item.cost
    end
    total
  end

  def make_payment_task
    MakePaymentJob.set(wait: 1.minutes).perform_now(self)
  end
end
