require 'rails_helper'

RSpec.describe 'locations#destroy', type: :request do

  let(:admin) { create(:admin, password: 'password') }
  let(:location) { create(:location) }

  context 'when admin' do
    it 'should destroy' do
      post login_path, session: { email: admin.email, password: admin.password }
      delete brand_location_path :destroy, :id => location
    end
  end
end
