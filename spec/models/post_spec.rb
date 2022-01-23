require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = create(:post)
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one_attached(:image) }
  end

  it "valid if has both message and image" do
    expect(@post).to be_valid
  end

  it "valid if has just an image" do
    @post.message = nil
    expect(@post).to be_valid
  end

  it "not valid if just message" do
    @post.image.purge
    expect(@post).to_not be_valid
  end

  it "valid if message is less than 50 char" do
    post = build(:post, message: "#{'a'*50}")
    expect(post).to be_valid
  end

  it "not valid if message is greater than 50 char" do
    post = build(:post, message: "#{'a'*51}")
    expect(post).to_not be_valid
  end

end
