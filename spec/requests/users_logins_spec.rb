require 'rails_helper'

RSpec.describe "User Logging in", type: :request do

  it "rejects invalid parameters in sign in form" do
    get "/login"
    expect(response).to render_template(:new)
    post "/login", :user => {:email => "", :password => ""}
    expect(response).to render_template(:new)
  end

  it "allows valid parameters in the sign in form" do
    get "/login"
    expect(response).to render_template(:new)
    post "/users", :user => {:name => "Grant", :email => "grant@smswmedia.com",
      :password => "foobar", :password_confirmation => "foobar"}
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end
