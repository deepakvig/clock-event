require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = attributes_for(:user).merge({email: nil})
    expect(User.new(user)).to_not be_valid
  end

  it "is valid with valid attributes" do
    user = attributes_for(:user)
    expect(User.new(user)).to be_valid
  end
end
