require 'rails_helper'

RSpec.describe 'location#destroy', type: :request do

  let(:admin) { create(:admin, password: 'password') }
  let(:user) { create(:user, password: 'password') }
  let(:location) { create(:location) }
  let(:brand){ create(:brand) }

  context 'when admin' do
    it 'should destroy' do
      post login_path, session: { email: admin.email, password: admin.password }
      delete brand_locations_path :destroy, :id => location
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when user' do
    it 'should fail' do
      post login_path, session: { email: user.email, password: user.password }
      delete brand_locations_path :destroy, :id => location
      follow_redirect!
      expect(response).to have_http_status(401)
    end
  end

  context 'when guest' do
    it 'should fail' do
      delete brand_locations_path :destroy, :id => location
      follow_redirect!
      expect(response).to have_http_status(401)
    end
  end

end
