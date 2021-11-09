class RegionSerializer < ActiveModel::Serializer
  attributes :id, :title, :country, :currency, :tax
  has_many :products
end
