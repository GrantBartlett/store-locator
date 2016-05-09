class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  skip_before_action :require_admin, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      flash[:notice] = 'Successfully logged in as ' + user.name
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to users_path
    flash[:notice] = 'Successfully logged out'
  end
end
