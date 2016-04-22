class LocationsController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]
  skip_before_action :require_admin, only: [:index, :show]
  before_action :set_brand

  def index
    @locations = @brand.locations.all
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
    @location = Location.find(params[:id])
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
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
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
