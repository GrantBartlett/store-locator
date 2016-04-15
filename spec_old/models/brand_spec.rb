require 'rails_helper'

RSpec.describe Brand, type: :model do
  let(:brand) { create(:brand) }

  context 'brand' do
    it 'should be a valid object' do
      expect(brand).to be_valid
    end

    it 'should not exist already' do
      duplicate_brand = brand.dup
      duplicate_brand.title = brand.title
      brand.save
      expect(duplicate_brand).not_to be_valid
    end
  end

  context 'title' do
    it 'should not be left blank' do
      expect(brand.title).not_to be_empty
    end
  end

  context 'logo' do
    it 'should not be left blank' do
      expect(brand.logo).not_to be_empty
    end
  end

  context 'url' do
    it 'should not be left blank' do
      expect(brand.url).not_to be_empty
    end
  end

  context 'description' do
    it 'should not be left blank' do
      expect(brand.description).not_to be_empty
    end
  end
end
