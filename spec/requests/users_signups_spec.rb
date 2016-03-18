require "rails_helper"

RSpec.describe "User Signups", :type => :request do

  it "should not allow invalid invalid signup parameters" do
    before_count = User.count
    get "/users/new"
    expect(response).to render_template(:new)

    post "/users/", user: { name:  "",
      email: "user@invalid",
      password:              "foo",
      password_confirmation: "bar" }

      after_count  = User.count
      expect(before_count).to eq(after_count)
    end
  end
