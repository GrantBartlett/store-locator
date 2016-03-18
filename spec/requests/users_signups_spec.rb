require "rails_helper"

RSpec.describe "User Registering", :type => :request do

  it "rejects invalid parameters in sign up form" do
    get "/users/new"
    expect(response).to render_template(:new)
    post "/users", :user => {:name => "Grant"}
    expect(response).to render_template(:new)
  end
end

# it "allows valid parameters in a sign up form" do
#   get "/users/new"
#   expect(response).to render_template(:new)
#   post "/users", :user => {:name => "Foo", :email => "foo@bar.com",
#     :password => "FooBar", :password_confirmation => "FooBar"}
#     expect(response).to redirect_to(assigns(:user))
#     follow_redirect!
#     expect(response).to render_template(:show)
#   end
# end
