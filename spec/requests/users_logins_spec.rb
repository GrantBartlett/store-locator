require 'rails_helper'

RSpec.describe "User logging in", type: :request do

  it "rejects invalid parameters in sign in form" do
    get "/login"
    expect(response).to render_template(:new)
    post "/login", :user =>
    {
      :email => "",
      :password => ""
    }
    expect(response).to render_template(:new)
  end

  # it "with VALID parameters" do
  #
  #   user = build(:user)
  #
  #   # it 'sets the type_id field' do
  #   #   # expect(resource.type_id).to equal(type.id)
  #   #
  #   #   get "/login"
  #   #   # expect(response).to render_template(:new)
  #   #   # post "/users", :user =>
  #   #   # {
  #   #   #   :email => @user.email,
  #   #   #   :password => 'password'
  #   #   # }
  #   #   # expect(response).to redirect_to(assigns(@user))
  #   # end
  # end
end
