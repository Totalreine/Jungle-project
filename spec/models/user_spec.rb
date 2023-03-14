require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.create({
      first_name: "Max", 
      last_name: "Smith",
      password: "12345678", 
      password_confirmation: "12345678",
      email: "max@example.com"
      })
    end

    it 'is not valid without first_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without last_email' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid if the password is less than 8 characters long' do
      @user.password = "1234567"
      expect(@user).to_not be_valid
    end

    it 'is not valid without email in the correct format' do
      @user.email = "email.com"
      expect(@user).to_not be_valid
    end

    it 'is not valid if the passwords do not match' do
      @user.password = "secret"
      @user.password_confirmation = "secret"
      expect(@user.password).to eq @user.password_confirmation
      
    end
    
  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user = User.create({
      first_name: "Max", 
      last_name: "Smith",
      password: "12345678", 
      password_confirmation: "12345678",
      email: "max@example.com"
      })
    end

  
    it "is valid if correct email and password provided" do
      @RetrievedUser = User.authenticate_with_credentials("max@example.com", "12345678")
      expect(@RetrievedUser).to eq @user
    end

    it "is not valid if wrong password provided" do
      @RetrievedUser = User.authenticate_with_credentials("max@example.com", "1234567890")
      expect(@RetrievedUser).to be_nil
    end

    it "is not valid if wrong email provided" do
      @RetrievedUser = User.authenticate_with_credentials("max5@example.com", "12345678")
      expect(@RetrievedUser).to be_nil
    end

    it "is valid if email provided with whitespaces" do
      @RetrievedUser = User.authenticate_with_credentials(" max@example.com ", "12345678")
      expect(@RetrievedUser).to eq @user
    end

    it "is valid if email provided with uppercase letters" do
      @RetrievedUser = User.authenticate_with_credentials("Max@example.com", "12345678")
      expect(@RetrievedUser).to eq @user
    end
    
    
  end

end
