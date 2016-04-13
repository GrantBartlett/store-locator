require 'rails_helper'
# params[:location].permit([:name, :lat, :lng, :content, :url])
RSpec.describe 'location#create', type: :request do

  let(:admin) { create(:admin, password: 'password') }
  let(:user) { create(:user, password: 'password') }
  let(:location) { create(:location) }
  let(:brand){ create(:brand) }

  context 'when admin' do
    it 'should create' do
      post login_path, session: { email: admin.email, password: admin.password }
      post brand_locations_path(brand),
      :location => {
        :name => location.name,
        :lat => location.lat,
        :lng => location.lng,
        :content => location.content,
        :url => location.url
      }
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it 'should reject invalid parameters' do
      post login_path, session: { email: admin.email, password: admin.password }
      post brand_locations_path(brand),
      :location => {
        :namex => location.name,
        :lat_wrong => '',
        :lng => '',
        :content => location.content,
        :url_wrong => location.url
      }
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'when user' do
    it 'should fail' do
      post login_path, session: { email: user.email, password: user.password }
      post brand_locations_path(brand),
      :location => {
        :name => location.name,
        :lat => location.lat,
        :lng => location.lng,
        :content => location.content,
        :url => location.url
      }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'when guest' do
    it 'should fail' do
      post brand_locations_path(brand),
      :location => {
        :name => location.name,
        :lat => location.lat,
        :lng => location.lng,
        :content => location.content,
        :url => location.url
      }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
