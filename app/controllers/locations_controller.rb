class LocationsController < ApplicationController
  before_action :set_brand

  def index
    @locations = @brand.locations.all
    render json: @locations
  end

  def create
    @location = @brand.locations.new(location_params)
    if is_admin?
      respond_to do |f|
        if @brand.save
          f.html { redirect_to @brand }
          f.json { render :show, status: :created, location: @brand }
        else
          f.html { render :new }
          f.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    # todo
  end


  private
  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  def location_params
    params[:location].permit([:name, :lat, :lng, :content, :url])
  end
end
