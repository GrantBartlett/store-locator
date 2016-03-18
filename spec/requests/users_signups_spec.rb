require "rails_helper"

RSpec.describe "User signups", :type => :request do

  it "rejects invalid parameters in sign up form" do
    get "/users/new"
    expect(response).to render_template(:new)
    post "/users", :user => {:name => "Grant"}
    expect(response).to render_template(:new)
  end

  it "allows valid parameters in a sign up form" do
    get "/users/new"
    expect(response).to render_template(:new)
    post "/users", :user => {:name => "Grant", :email => "grant@smswmedia.com",
      :password => "foobar", :password_confirmation => "foobar"}
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!
      expect(response).to render_template(:show)
  end

end
