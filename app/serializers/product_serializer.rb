class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :sku, :stock, :image_url

  def image_url
    object.get_image_url
  end
end
