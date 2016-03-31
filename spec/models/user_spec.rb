require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @test_user = create(:user, password: 'password')
  end

  describe "user object" do
    it "should be valid" do
      expect(@test_user).to be_valid
    end
  end

  describe "name field" do
    it "should not be left blank" do
      expect(@test_user.name).not_to be_empty
    end
  end

  describe "email field" do
    it "should not be left blank" do
      expect(@test_user.email).not_to be_empty
    end
  end

  describe "email address" do
    it "should be unique upon saving to the database" do
      duplicate_user = @test_user.dup
      duplicate_user.email = @test_user.email.upcase
      @test_user.save
      expect(duplicate_user).not_to be_valid
    end

    it "should not be mixed case upon saving to the database" do
      mixed_case_email = "gRaNt@smswmedia.com"
      @test_user.email = mixed_case_email
      @test_user.save
      expect(@test_user.email).not_to eq(mixed_case_email)
    end
  end

  describe "password" do
    it "should not be left blank" do
      @test_user.password = @test_user.password_confirmation = " " * 6
      expect(@test_user).to_not be_valid
    end

    it "should have a minimum length" do
      @test_user.password = @test_user.password_confirmation = "a" * 5
      expect(@test_user).to_not be_valid
    end
  end
end
