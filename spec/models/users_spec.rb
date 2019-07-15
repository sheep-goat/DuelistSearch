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
end