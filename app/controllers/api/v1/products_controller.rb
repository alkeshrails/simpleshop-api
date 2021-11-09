class Api::V1::ProductsController < ApplicationController
  # skip_before_action :authorize_request, except: :create
  before_action :find_product, except: %i[create index]
  before_action :check_admin_access, except: [:show, :index]

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def show
    render json: @product, status: :ok
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    render json: 'Deleted Successfully', status: :ok
  end

  private

  def find_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'product not found' }, status: :not_found
  end

  def product_params
    params.require(:product).permit(:title, :description, :sku, :price, :stock, :region_id, :image)
  end
end
