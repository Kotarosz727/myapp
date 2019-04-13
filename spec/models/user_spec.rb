require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name:nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = FactoryBot.build(:user, email:nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password:nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    FactoryBot.create(:user, name: "123")
    user = FactoryBot.build(:user, name: "123")
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "123@example.com")
    user = FactoryBot.build(:user, email: "123@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

end
