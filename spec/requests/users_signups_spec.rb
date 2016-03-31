require "rails_helper"

RSpec.describe "User Registering", :type => :request do

  describe "POST #create" do

    it "accepts valid sign-up parameters" do
      get "/users/new"
      expect(response).to render_template(:new)
      user = build(:user, :password => "password")
      # p user
      post "/users", :user => {:name => user.name, :email => user.email, :password => user.password}
    end

    it "redirects to new user" do
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end


  it "rejects invalid sign-up parameters" do
    get "/users/new"
    expect(response).to render_template(:new)
    post "/users", :user => {:name => "Grant", :email => ""}
    expect(response).to render_template(:new)
  end

  # it "accepts valid sign-up parameters" do
  #   get "/users/new"
  #   expect(response).to render_template(:new)
  #   user = create(:user, password: "password")
  #   p user
  #   # post "/users", :user => {:name => user.name, :email => user.email, :password => user.password}
  # end
  #
  # it "redirects to widget_url(@widget)" do
  #   expect(response).to redirect_to(widget_url(assigns(:widget)))
  # end
end

# it "allows valid parameters in a sign up form" do
# get "/users/new"
# expect(response).to render_template(:new)
# post "/users", :user => {:name => "Foo", :email => "foo@bar.com",
#   :password => "FooBar", :password_confirmation => "FooBar"}
#   expect(response).to redirect_to(assigns(:user))
#   follow_redirect!
#   expect(response).to render_template(:show)
# end
# end
