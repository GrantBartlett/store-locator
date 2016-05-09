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
    if !is_admin?
      unless current_user == @user
        redirect_to(root_url)
      end
    end
  end

  def require_admin
    redirect_to(root_url) unless current_user.admin?
    flash[:error] = "Dang it! You don't have permission to do this!"
  end

  def require_user
    redirect_to(root_url) unless logged_in?
  end
end
