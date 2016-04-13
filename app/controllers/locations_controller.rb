class LocationsController < ApplicationController
  before_action :set_brand

  def index
    @locations = @brand.locations.all
    render json: @locations
  end

  def create
    if is_admin?
      @location = @brand.locations.new(location_params)
      if @brand.save
        redirect_to @brand
      else
        head :bad_request
      end
    else
      head :unauthorized
    end
  end

  def destroy
    if is_admin?
      @location = @brand.locations.find(params[:id])
      if @location.destroy
        redirect_to @brand
      else
        head :bad_request
      end
    else
      head :unauthorized
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
