require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  it "is valid with a valid username and password" do
    expect(@user).to be_valid
  end 

  it "is not valid without an email with an @" do
    user = build(:user, email: 'testtest.com')
    expect(user).to_not be_valid
  end

  it "is not valid without a sufficiently long password" do
    user = build(:user, password: 'test')
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a unique email" do
    user = build(:user, email: 'test@gmail.com')
    expect(user).to_not be_valid
  end  
end
