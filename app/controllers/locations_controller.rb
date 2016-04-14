class LocationsController < ApplicationController
  before_action :set_brand

  def index
    @locations = @brand.locations.all
    render json: @locations
  end

  def show
  end

  def create
    if is_admin?
      @location = @brand.locations.new(location_params)
      if @location.save
        redirect_to @brand
      else
        head :bad_request
      end
    else
      head :unauthorized
    end
  end

  def update
  end

  def destroy
    @brand_location = @brand.locations.find(params[:id])
    if @brand_location.destroy
      redirect_to @brand
    end
  end

  private
  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  def location_params
    params[:location].permit([:name, :lat, :lng, :content, :url])
  end
end
