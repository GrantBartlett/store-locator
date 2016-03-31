require "rails_helper"

RSpec.describe "User Registering", :type => :request do
  describe "POST #create" do
    it "accepts valid sign-up parameters" do
      get "/users/new"
      expect(response).to render_template(:new)
      user = build(:user, :password => "password")
      # p user
      post "/users", :user => {:name => user.name, :email => user.email, :password => user.password}
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it "rejects invalid sign-up parameters" do
      get "/users/new"
      expect(response).to render_template(:new)
      post "/users", :user => {:name => "Grant", :email => ""}
      expect(response).to render_template(:new)
    end
  end
end
