require 'rails_helper'

RSpec.describe "Brands", type: :request do
  let(:brand) {create(:brand)}
  let(:admin) {create(:admin, password: 'password')}

  before(:each) do
    post '/login', session: { email: admin.email, password: 'password'}
    post '/brands', :brand => { :title => brand.title, :logo => brand.logo, :url => brand.url, :description => brand.description }
  end

  context "GET requests" do
    it "returns 200 brands#index" do
      get brands_path
      expect(response).to have_http_status(200)
    end

    it "returns 200 brands#edit" do
      get edit_brand_path(brand)
      expect(response).to have_http_status(200)
    end

    it "returns 200 brands#new" do
      get new_brand_path
      expect(response).to have_http_status(200)
    end

    it "returns 200 brands#show" do
      get brand_path(brand)
      expect(response).to have_http_status(200)
    end
  end
end
