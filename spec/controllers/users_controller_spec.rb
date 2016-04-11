require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context 'GET #edit_user_path' do
    it 'returns http success' do
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end
end
