require 'rails_helper'

RSpec.describe "brand#update", type: :request do
  let(:admin) { create(:admin, password: 'password') }
  let(:brand) { create(:brand) }

  context 'when user updates brand' do
    it 'should return 200 for edit_brand_path' do
      get edit_brand_path(brand)
      expect(response).to have_http_status(:success)
    end

    it 'should succeed with valid parameters' do
      patch brand_path(brand), :brand =>
      {
        :title => Faker::Company.name,
        :logo => Faker::Company.logo,
        :description => Faker::Company.catch_phrase,
        :url => Faker::Company.name
      }
      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it 'should fail with invalid parameters' do
      patch brand_path(brand), :brand =>
      {
        :title => '',
        :bad_field => Faker::Company.logo,
        :description => Faker::Company.catch_phrase,
        :url => Faker::Company.name
      }
      expect(response).to render_template(:edit)
    end
  end
end
