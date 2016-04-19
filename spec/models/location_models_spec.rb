require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { create(:location) }

  # params[:location].permit([:name, :lat, :lng, :content, :url])
  context 'location object' do
    it 'should be valid' do
      expect(location).to be_valid
    end
  end

  context 'name field' do
    it 'should not be left blank' do
      expect(location.name).not_to be_empty
    end
  end

  context 'lat field' do
    it 'should not be left blank' do
      expect(location.lat).not_to be_empty
    end
  end

  context 'content field' do
    it 'should not be left blank' do
      expect(location.content).not_to be_empty
    end
  end

  context 'url field' do
    it 'should not be left blank' do
      expect(location.url).not_to be_empty
    end
  end
end
