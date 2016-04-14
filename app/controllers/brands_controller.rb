class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :find_current_user, only:[:new, :create, :update, :destroy]
  before_action :signed_in_user, only:[:new, :create, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def create
    @brand = @current_user.brands.new(brand_params)
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
    @brand = Brand.find(params[:id])
    if @brand.destroy
      @brand.destroy
      redirect_to brands_path
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

  def find_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:title, :logo, :url, :description, :published)
  end
end
