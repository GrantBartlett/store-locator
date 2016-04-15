class HomeController < ApplicationController
  skip_before_action :require_user, only: [:index]
  skip_before_action :require_admin, only: [:index]
  def index
  end
end
