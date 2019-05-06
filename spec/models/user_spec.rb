# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it 'is invalid without a email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  it 'is invalid with a duplicat' do
    FactoryBot.create(:user, name: '123')
    user = FactoryBot.build(:user, name: '123')
    user.valid?
    expect(user.errors[:name]).to include('はすでに存在します')
  end

  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: '123@example.com')
    user = FactoryBot.build(:user, email: '123@example.com')
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end
end
