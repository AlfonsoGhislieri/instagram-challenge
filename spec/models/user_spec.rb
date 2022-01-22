require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    email: "test@test.com",
    password: "123456",
  )}

  it "is valid with a valid username and password" do
    expect(subject).to be_valid
  end 

  it "is not valid without an email with an @" do
    subject.email = "testtest.com"
    expect(subject).to_not be_valid
  end

  it "is not valid without a sufficiently long password" do
    subject.password = "123"
    expect(subject).to_not be_valid
  end
  
end
