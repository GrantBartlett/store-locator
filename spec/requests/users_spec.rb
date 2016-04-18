require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:brand) {create(:brand)}
  let(:user) {create(:user, password: 'password')}
  let(:admin) {create(:admin, password: 'password')}

  context "GET requests" do
    before(:each) do
      post '/login', session: { email: user.email, password: 'password'}
      post '/brands', :brand => { :title => brand.title, :logo => brand.logo, :url => brand.url, :description => brand.description }
    end

    it "returns 200 users#index" do
      post '/login', session: { email: admin.email, password: 'password'}
      get users_path
      expect(response).to have_http_status(200)
    end

    it "returns 200 users#edit" do
      get edit_user_path(user)
      expect(response).to have_http_status(200)
    end

    it "returns 200 users#new" do
      get new_user_path
      expect(response).to have_http_status(200)
    end

    it "returns 200 users#show" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

end
