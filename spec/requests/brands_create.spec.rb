require "rails_helper"
# params.require(:brand).permit(:title, :logo, :url, :description, :published)
RSpec.describe "brand#create", type: :request do
  let(:admin) { create(:admin, password: 'password') }
  let(:user) { create(:user, password: 'password') }

  context 'create brand as admin' do
    it 'should succeed with valid parameters' do
      post '/login', session: { email: admin.email, password: 'password'}
      post '/brands', :brand => { :title => 'test', :logo => 'test', :url => 'test', :description => 'test' }
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it 'should reject invalid parameters' do
      post '/login', session: { email: admin.email, password: 'password'}
      post '/brands', :brand => { title: '', logo: '' }
      expect(response).to render_template(:new)
    end
  end

  context 'create brand as user' do
    it 'should not succeed with valid parameters' do
      post '/login', session: { email: user.email, password: 'password'}
      post '/brands', :brand => { :title => 'test', :logo => 'test', :url => 'test', :description => 'test' }
      expect(response).to have_http_status(401)
    end
  end

  context 'create brand as guest' do
    it 'should not succeed with valid parameters' do
      post '/brands', :brand => { :title => 'test', :logo => 'test', :url => 'test', :description => 'test' }
      expect(response).to have_http_status(401)
    end
  end
end
