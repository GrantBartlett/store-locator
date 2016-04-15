class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create, :edit] # Restrict everything but the following
  skip_before_action :require_admin, only: [:show, :new, :create, :edit, :update] # Restrict everything but the following
  before_action :correct_user, only: [:show, :edit, :update, :destroy] # Restrict viewing, editing, and destroying other users

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      @user.destroy
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
