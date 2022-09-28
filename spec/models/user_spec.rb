require 'rails_helper'

RSpec.describe User, type: :model do

   describe 'Validations' do

        it "is valid with valid attributes: first name, last name, email, password and password_confirmation" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "password"
          @user.password_confirmation = "password"
          @user.save

          expect(@user).to be_valid

        end

        it "is not valid without first name" do
          @user = User.new
          @user.id = 1
          @user.first_name = nil
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "0"
          @user.password_confirmation = "0"
          @user.save

          expect(@user).to_not be_valid
          expect(@user.errors.full_messages).to include("First name can't be blank")

        end

         it "is not valid without last name" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = nil
          @user.email = "email@email"
          @user.password = "0"
          @user.password_confirmation = "0"
          @user.save

          expect(@user).to_not be_valid
          expect(@user.errors.full_messages).to include("Last name can't be blank")

        end

         it "is not valid without email" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = nil
          @user.password = "0"
          @user.password_confirmation = "0"
          @user.save

          expect(@user).to_not be_valid
          expect(@user.errors.full_messages).to include("Email can't be blank")

        end

        it "is not valid if password is less than 3 characters" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "0"
          @user.password_confirmation = "0"
          @user.save

          expect(@user).to_not be_valid
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")

        end

        it "is not valid if password and password_confirmation don't match" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "hello"
          @user.password_confirmation = "password"
          @user.save

          expect(@user).to_not be_valid
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

        end
   end

     describe '.authenticate_with_credentials' do

        it "authenticates when credentials are valid" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "password"
          @user.password_confirmation = "password"
          @user.save

          # User.authenticate_with_credentials(@user.email, @user.password)
          expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq @user

        end

        it "returns nil if the email cannot be authenticated" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = nil
          @user.password = "0"
          @user.password_confirmation = "0"
          @user.save

         expect(User.authenticate_with_credentials(@user.email, @user.password)).to_not eq @user
        end

        it "returns nil if the password cannot be authenticated" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = nil
          @user.password_confirmation = nil
          @user.save

         expect(User.authenticate_with_credentials(@user.email, @user.password)).to_not eq @user
        end

         it "authenticates when email regardless of case" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "password"
          @user.password_confirmation = "password"
          @user.save

          # User.authenticate_with_credentials(@user.email, @user.password)
          expect(User.authenticate_with_credentials("email@EMAIL", @user.password)).to eq @user

        end

        it "authenticates when email entered with whitespace" do
          @user = User.new
          @user.id = 1
          @user.first_name = "first"
          @user.last_name = "last"
          @user.email = "email@email"
          @user.password = "password"
          @user.password_confirmation = "password"
          @user.save

          # User.authenticate_with_credentials(@user.email, @user.password)
          expect(User.authenticate_with_credentials("   email@email    ", @user.password)).to eq @user
        end
  end 
end