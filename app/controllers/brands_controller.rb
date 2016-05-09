class BrandsController < ApplicationController
  skip_before_action :require_user, only: [:show]
  skip_before_action :require_admin, only: [:show]
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def create
    @brand = current_user.brands.new(brand_params)
    if @brand.save
      flash[:notice] = "Brand successfully created!"
      redirect_to @brand
    else
      render 'new'
    end
  end

  def update
    if @brand.update_attributes(brand_params)
      flash[:notice] = "Brand successfully updated!"
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def destroy
    if @brand.destroy
      flash[:notice] = "Brand successfully removed!"
      @brand.destroy
      redirect_to brands_path
    end
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find Brand.decrypt(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:title, :logo, :url, :description, :published)
  end
end
