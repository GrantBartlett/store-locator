require "rails_helper"

RSpec.describe "user#create", type: :request do

  context 'sign up' do
    it 'should create new user' do
      post '/users', :user => { :name => 'example', :email => 'example@example.com', :password => 'password', :password_confirmation => 'password' }
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it 'should reject invalid parameters' do
      post '/users', :user => { email: '', password: '' }
      expect(response).to render_template(:new)
    end
  end
end
