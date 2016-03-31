require 'rails_helper'

RSpec.describe "Users", type: :request do

  it "rejects invalid login credentials" do
    get "/login"
    render_template 'sessions/new'
    post "/login", session: { email: "", password: "" }
    render_template 'sessions/new'
  end

  it "accepts valid login credentials" do
    get "/login"
    user = create(:user, password: "password")
    post "/login", session: { email: user.email, password: 'password'}
    redirect_to user
    follow_redirect!
    render_template 'users/show'
  end
end
