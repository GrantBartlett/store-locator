class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to @brand
    else
      render 'new'
    end
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(brand_params)
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def destroy
    if is_admin?
      @brand = Brand.find(params[:id])
      if @brand.destroy
        @brand.destroy
        redirect_to brands_path
      end
    else
      head 401
    end
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:title, :logo, :url, :description, :published)
  end

  after_action :verify_authorized, only: [:edit, :update, :destroy]
end
