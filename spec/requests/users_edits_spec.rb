require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do
  describe "GET /users_edits" do

    before(:each) do
      @user_to_update = create(:user, password: 'password')
    end

    it "returns 200 for edit_user_path" do
      get edit_user_path(@user_to_update)
      expect(response).to have_http_status(200)
    end

    it "accepts valid update parameters and saves" do
      patch user_path(@user_to_update), :user =>
      {
        :name => Faker::Name.name,
        :email => @user_to_update.email,
        :password => 'password',
        :password_confirmation => 'password'
      }
      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it "rejects invalid update parameters" do
      patch user_path(@user_to_update), :user =>
      {
        :name => "",
        :email => @user_to_update.email,
        :password => 'password',
        :password_confirmation => 'password'
      }
      expect(response).to render_template(:edit)
    end
  end
end
