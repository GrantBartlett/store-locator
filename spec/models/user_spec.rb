require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(name: "Grant", email: "grant@smswmedia.com", password: "foobar", password_confirmation: "foobar")
  end

  describe "user object" do
    it "should be valid" do
      expect(@user).to be_valid
    end
  end

  describe "name field" do
    it "should not be left blank" do
      expect(@user.name).not_to be_empty
    end
  end

  describe "email field" do
    it "should not be left blank" do
      expect(@user.email).not_to be_empty
    end
  end

  describe "email address" do
    it "should be unique upon saving to the database" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it "should not be mixed case upon saving to the database" do
      mixed_case_email = "gRaNt@smswmedia.com"
      @user.email = mixed_case_email
      @user.save
      expect(@user.email).not_to eq(mixed_case_email)
    end
  end

  describe "password" do
    it "should not be left blank" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to_not be_valid
    end

    it "should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to_not be_valid
    end
  end
end
