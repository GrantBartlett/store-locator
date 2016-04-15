require 'rails_helper'

RSpec.describe 'user#destroy', type: :request do
  let(:user) { create(:user, password: 'password') }
  let(:admin) { create(:admin, password: 'password') }

  context 'when admin' do
    it 'should destroy' do
      post '/login', session: { email: admin.email, password: 'password'}
      delete user_path :destroy, :id => user
      follow_redirect!
      expect(response).to render_template(:index)
    end
  end

  context 'when user' do
    it 'should not destroy' do
      post '/login', session: { email: user.email, password: 'password'}
      delete user_path :destroy, :id => user
      expect(response).to have_http_status(401)
    end
  end

  context 'when guest' do
    it 'should not destroy' do
      delete user_path :destroy, :id => user
      expect(response).to have_http_status(401)
    end
  end
end
