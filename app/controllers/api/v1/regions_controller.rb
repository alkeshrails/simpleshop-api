class Api::V1::RegionsController < ApplicationController
  # before_action :authorize_request, except: :create
  before_action :set_region, only: [:show, :update, :destroy]
  before_action :check_admin_access, except: [:show, :index]

  # GET /regions
  def index
    @regions = Region.all

    render json: @regions
  end

  # GET /regions/1
  def show
    render json: @region
  end

  # POST /regions
  def create
    @region = Region.new(region_params)

    if @region.save
      render json: @region, status: :created
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /regions/1
  def update
    if @region.update(region_params)
      render json: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
    render json: 'Deleted Successfully', status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_region
    @region = Region.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def region_params
    params.require(:region).permit(:title, :country, :currency, :tax)
  end
end
