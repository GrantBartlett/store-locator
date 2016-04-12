require 'rails_helper'
# params[:location].permit([:name, :lat, :lng, :content, :url])
RSpec.describe 'location#create', type: :request do
  let(:admin) { create(:admin, password: 'password') }
  let(:user) { create(:user, password: 'password') }
  let(:location) { create(:location) }
  let(:brand){ create(:brand) }

  context 'when admin' do
    it 'should create' do
      # post '/login', session: { email: admin.email, password: 'password'}
      # post '/brand_locations', :location => { :name => location.name, :lat => 'test', :lng => 'test', :content => 'test', :url => 'test' }
      # follow_redirect!
      # expect(response).to render_template(:show)
    end
  end
end
