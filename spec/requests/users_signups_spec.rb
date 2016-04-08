require "rails_helper"

RSpec.describe "user#create", type: :request do
  let(:user) { create(:user, password: 'password') }

  context 'signing up' do
    it 'should create new user' do
      post "/users", :user => { name: user.name, email: user.email, password: user.password}
      follow_redirect!
      expect(response).to render_template(:show)
      # todo: fix 
    end

    it 'should reject invalid parameters' do
      post '/users', :user => { email: '', password: '' }
      expect(response).to render_template(:new)
    end
  end
end
