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
end