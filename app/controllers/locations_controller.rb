class LocationsController < ApplicationController
  skip_before_action :require_user, only: [:show]
  skip_before_action :require_admin, only: [:show]
  before_action :set_brand

  def index
    @locations = @brand.locations
    render json: @locations
  end

  def create
    @location = @brand.locations.new(location_params)
    if @location.save
      redirect_to @brand
    else
      render 'new'
    end
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def destroy
    @location = @brand.locations.find(params[:id])
    if @location.destroy
      @location.destroy
      redirect_to @brand
    end
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find Brand.decrypt(params[:brand_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params[:location].permit([:name, :lat, :lng, :content, :url])
  end
end
