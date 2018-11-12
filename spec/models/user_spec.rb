require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
  it "Should have a valid password input" do
    user = User.new(name: "Matt damon", email: "damon@gmail.com" , password: "damon",  password_confirmation: 'damon')
    expect(user).to be_valid
  end
  it "Should have matching password fields" do 
    user = User.new(name: "Matt damon", email: "damon@gmail.com", password: "i Love matt damon", password_confirmation: 'Matt damon sucks')
    user.password == user.password_confirmation
  end
  it "two users should not have matching emails" do 
    user = User.new({name: "Matt damon", email: "damon@gmail.com",  password: "i Love matt damon", password_confirmation: 'Matt damon sucks'})
    user.save()
    user2 = User.new({name: "Matt damon", email: "DAMON@gmail.com", password: "i Love matt damon", password_confirmation: 'Matt damon sucks'})
    expect(user2).to_not be_valid
  end
  it "password should have minimum length" do 
      user = User.new({name: "Matt damon", email: "damon@gmail.com",  password: "i Love matt damon", password_confirmation: 'Matt'})
      expect(user).to_not be_valid
  end     
  it "should have authenticated user" do 
    @user1 = User.new({name: "Dingus", email: "damon@gmail.com",  password: "ding45445", password_confirmation: 'ding45445'})
    @user1.save()
    @user = User.authenticate_with_credentials(@user1.email, @user1.password)
    expect(@user).to eql(@user1) 
    expect(@user).to_not be_valid
   end
  it "should verify with trailing spaces in email" do 
    @user3 = User.new({name: "Durp", email: "damon@gmail.com",  password: "ding45445", password_confirmation: 'ding45445'})
    @user3.save()
    @user = User.authenticate_with_credentials('damon@gmail.com  ', @user3.password)
    expect(@user).to eql(@user3)
    expect(@user).to eql(@user3)
  end
  it "should verify with  diffrent letter" do
  @user4 = User.new({name: "hommer", email: "damon@gmail.com",  password: "ding45445", password_confirmation: 'ding45445'})
  @user4.save()
  @user = User.authenticate_with_credentials('dAMon@gmail.com', @user4.password)
  expect(@user).to eql(@user4)
  expect(@user).to eql(@user4)
   end 
  end 
 end 



