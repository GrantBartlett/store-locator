require "rails_helper"
# params.require(:brand).permit(:title, :logo, :url, :description, :published)
RSpec.describe "brand#create", type: :request do

  context 'new brand' do
    it 'should succeed with valid parameters' do
      post '/brands', :brand => { :title => 'test', :logo => 'test', :url => 'test', :description => 'test' }
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it 'should reject invalid parameters' do
      post '/brands', :brand => { title: '', logo: '' }
      expect(response).to render_template(:new)
    end
  end
end
