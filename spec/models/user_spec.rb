require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before(:each) do
      @user = User.new(
        first_name: "first name",
        last_name: "last name",
        email: "myemail@email.com",
        password: "password",
        password_confirmation: "password")
    end

    it "is valid with valid attributes" do
      @user.save
      expect(@user).to be_valid
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a password" do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a password confirmation" do
      @user.password_confirmation = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid without a different password than password confirmation" do
      @user.password_confirmation = "not same password"
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid with the same email as someone else in the db" do
      @user.save
      @user2 = User.new(
        first_name: "first 2 name",
        last_name: "last 2 name",
        email: "myemail@email.com",
        password: "password",
        password_confirmation: "password")
      @user2.save
      
      expect(@user2).to_not be_valid
    end

    it "is not valid with the same email that is a different case" do
      @user.save
      @user2 = User.new(
        first_name: "first 2 name",
        last_name: "last 2 name",
        email: "mYeMaIl@EmAiL.cOm",
        password: "password",
        password_confirmation: "password")
      @user2.save
      
      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(
        first_name: "first name",
        last_name: "last name",
        email: "myemail@email.com",
        password: "password",
        password_confirmation: "password")
    end

    it "is valid with the right password" do
      @user.save
      user_authenticated = User.authenticate_with_credentials("myemail@email.com", "password")
      expect(user_authenticated).to be_a User
    end

    it "is not valid with the wrong password" do
      @user.save
      user_authenticated = User.authenticate_with_credentials("myemail@email.com", "wrongpassword")
      expect(user_authenticated).to_not be_a User
    end

    it "is valid with the email containing trailing white space" do
      @user.save
      user_authenticated = User.authenticate_with_credentials(" myemail@email.com  ", "password")
      expect(user_authenticated).to be_a User
    end

    it "is valid with the email having different cases" do
      @user.save
      user_authenticated = User.authenticate_with_credentials(" mYeMaIl@EmAiL.cOm  ", "password")
      expect(user_authenticated).to be_a User
    end

  end

end
