require 'faker'

FactoryBot.define do
  factory :region do
    title { Faker::Name.name }
    country { 'USA' }
    currency { 'UDS' }
    tax { '0.01' }
  end
end
