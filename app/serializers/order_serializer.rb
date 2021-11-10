class OrderSerializer < ActiveModel::Serializer
  attributes :id, :customer_name, :shipping_address, :order_total, :paid_at, :status
  has_many :products
end
