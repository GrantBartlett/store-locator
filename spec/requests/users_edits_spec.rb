require 'rails_helper'

RSpec.describe "user#update", type: :request do
  let(:user) { create(:user, password: 'password') }

  context 'when user updates profile' do
    it 'should return 200 for edit_user_path' do
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end

    it "should save" do
      patch user_path(user), :user =>
      {
        :name => Faker::Name.name,
        :email => user.email,
        :password => 'password',
        :password_confirmation => 'password'
      }
      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it "should reject missing fields" do
      patch user_path(user), :user =>
      {
        :name => "",
        :email => user.email,
        :password => 'password',
        :password_confirmation => 'password'
      }
      expect(response).to render_template(:edit)
    end
  end
end
