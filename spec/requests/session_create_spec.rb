require 'rails_helper'

RSpec.describe 'session#create', type: :request do
  let(:user) { create(:user, password: 'password') }

  context 'when logging in' do
    it 'should create new session' do
      post '/login', session: { email: user.email, password: 'password'}
      redirect_to user
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it 'should reject invalid parameters' do
      post '/login', session: { email: '', password: '' }
      expect(response).to render_template(:new)
    end
  end
end
