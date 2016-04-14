require 'rails_helper'

RSpec.describe 'locations#destroy', type: :request do
  let(:admin) { create(:admin, password: 'password') }
  let(:location) { create(:location) }
  let(:brand) { create(:brand) }

  context 'when admin' do
    it 'should destroy' do
      post '/login', session: { email: admin.email, password: 'password'}
      delete brand_location_path(brand, location.id)
      follow_redirect!
      expect(response).to render_template(:index)
    end
  end
end
