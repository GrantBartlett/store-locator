class LocationsController < ApplicationController
  before_action :set_brand

  def index
    @locations = @brand.locations.all
    render json: @locations
  end

  def create
    if is_admin?
      @location = @brand.locations.new(location_params)
      respond_to do |f|
        if @brand.save
          f.html { redirect_to @brand, status: :created }
          f.json { render :show, status: :created, location: @brand }
        else
          f.html { redirect_to @brand, status: :unprocessable_entity }
          f.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    else
      head 401
    end
  end

  def destroy
    if is_admin?
      @location = @brand.locations.find(params[:id])
      if @location.destroy
        respond_to do |f|
          if @location.save
            f.html { redirect_to @brand, status: :ok }
            f.json { render :show, status: :ok, location: @brand }
          else
            f.html { redirect_to @brand, status: :bad_request }
            f.json { render json: @brand.errors, status: :bad_request }
          end
        end
      else
      end
    else
      head 401
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
