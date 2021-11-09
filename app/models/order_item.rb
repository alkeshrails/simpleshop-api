class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }

  def cost
    quantity * product.price
  end

  # def on_stock
  #   product&.stock || 0
  # end

  # def fulfillable?
  #   on_stock >= quantity
  # end
end
