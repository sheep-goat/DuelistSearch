require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  it 'is valid with username,nickname,email,password' do
    expect(@user.valid?).to be_truthy
  end
end