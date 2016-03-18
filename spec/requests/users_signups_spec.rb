require "rails_helper"
#
# RSpec.describe "User Signups", :type => :request do
#
#   it "should not allow invalid invalid signup parameters" do
#     before_count = User.count
#     get "/users/new"
#     expect(response).to render_template(:new)
#
#     post "/users/", user: { name:  "",
#       email: "user@invalid",
#       password:              "foo",
#       password_confirmation: "bar" }
#
#       after_count  = User.count
#       expect(before_count).to eq(after_count)
#     end
#
#
#     it "should create a User and redirect to the Users page" do
#       get "/users/new"
#       expect(response).to render_template(:new)
#
#       post "/users/", user: { name:  "User",
#         email: "user@example.com",
#         password:              "foobar",
#         password_confirmation: "foobar" }
#         expect(response).to have_http_status(:created)
#       end
#     end


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
    post "/users", :user => {:name => "Grant", :email => "grant@smswmedia.com", :password => "foobar", :password_confirmation => "foobar"}
    expect(response).to redirect_to(assigns(:user))
    follow_redirect!
    expect(response).to render_template(:show)
  end

end
