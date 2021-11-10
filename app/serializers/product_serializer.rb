class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :sku, :stock, :image_url
  belongs_to :region

  def image_url
    object.get_image_url if object.image.attached?
  end
end
