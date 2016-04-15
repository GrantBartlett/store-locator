class ApplicationController < ActionController::Base
  before_action :require_user
  before_action :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end

  def require_admin
    redirect_to(root_url) unless current_user.admin?
  end

  def require_user
    # flash[:error] = "401 oh noes! Please login to continue."
    redirect_to(root_url) unless logged_in?
  end
end
