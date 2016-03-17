class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])
  end

  # # GET /brands/new
  def new
    @brand = Brand.new
  end
  #
  # # GET /brands/1/edit
  # def edit
  # end
  #
  # # POST /brands
  # # POST /brands.json
  # def create
  #   @brand = Brand.new(brand_params)
  # end
  #
  # # PATCH/PUT /brands/1
  # # PATCH/PUT /brands/1.json
  # def update
  #   @brand.update(brand_params)
  # end
  #
  # # DELETE /brands/1
  # # DELETE /brands/1.json
  # def destroy
  #   @brand.destroy
  # end


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
