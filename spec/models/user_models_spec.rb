require 'rails_helper'

RSpec.describe "User", type: :model do
  let(:user) { create(:user, password: 'password') }

  context 'user object' do
    it 'should be valid' do
      expect(user).to be_valid
    end
  end

  context 'name field' do
    it 'should not be left blank' do
      expect(user.name).not_to be_empty
    end
  end

  context 'email field' do
    it 'should not be left blank' do
      expect(user.email).not_to be_empty
    end
  end

  context 'email address' do
    it 'should be unique when saving' do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user).not_to be_valid
    end

    it 'should not be mixed case when saving' do
      mixed_case_email = 'eXaMpLe@eXaMpLe.com'
      user.email = mixed_case_email
      user.save
      expect(user.email).not_to eq(mixed_case_email)
    end
  end

  context 'password' do
    it 'should not be left blank' do
      user.password = user.password_confirmation = " " * 6
      expect(user).to_not be_valid
    end

    it 'should have a minimum length' do
      user.password = user.password_confirmation = "a" * 5
      expect(user).to_not be_valid
    end
  end
end
