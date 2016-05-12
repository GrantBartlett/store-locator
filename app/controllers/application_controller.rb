class ApplicationController < ActionController::Base
  before_action :require_user
  before_action :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_locale

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
    if !current_user.admin?
      redirect_to(root_url)
      flash[:error] = "Dang it! You don't have permission to do this!"
    end
  end

  def require_user
    redirect_to(root_url) unless logged_in?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
