require 'faker'

FactoryBot.define do
  factory :product do
    title { Faker::String.name }
    description { 'description test' }
    price { Faker::Number.within(range: 1..500) }
    sku { Faker::Number.number }
    stock { 5 }
  end
end
