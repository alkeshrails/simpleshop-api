class Product < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :region
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_one_attached :image

  validates :sku, uniqueness: true
  # validates :image, presence: true

  def get_image_url
    url_for(self.image)
  end
end
