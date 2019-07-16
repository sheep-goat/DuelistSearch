require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  it 'is valid with username,nickname,email,password' do
    expect(@user.valid?).to be_truthy
  end

  it 'is invalid when the username is blank' do
    @user.username = ''
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid when the username contains "-"' do
    @user.username = 'test-test'
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid when the username is duplicated' do
    dup_username = @user.username
    @user.save

    @user = build(:user)
    @user.username = dup_username
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid when username is less than 2 characters' do
    @user.username = 'te'
    expect(@user.valid?).to be_falsey
  end

  it 'is valid when username is more than 3 characters' do
    @user.username = 'tes'
    expect(@user.valid?).to be_truthy
  end

  it 'is valid when username is less than 20 characters' do
    @user.username = 'test_test_test_test1'
    expect(@user.valid?).to be_truthy
  end

  it 'is invalid when username is more than 21 characters' do
    @user.username = 'test_test_test_test_t'
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid when nickname is blank' do
    @user.nickname = ''
    expect(@user.valid?).to be_falsey
  end

  it 'is valid when nickname is in Japanese' do
    @user.nickname = 'テストユーザ'
    expect(@user.valid?).to be_truthy
  end
end