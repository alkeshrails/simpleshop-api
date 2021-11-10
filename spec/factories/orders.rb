require 'faker'

FactoryBot.define do
  factory :order do
    customer_name { Faker::Name.name }
    shipping_address { Faker::Address.full_address }
    paid_at { Time.now }
    status { 'pending' }
    order_total { 200 }
  end
end
