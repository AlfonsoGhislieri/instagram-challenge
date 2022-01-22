require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = create(:post)
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  it "not valid if post has neither a message or a image" do
    post = build(:post, message: nil) 
    expect(post).to_not be_valid
  end

  it "valid if just message" do
    expect(@post).to be_valid
  end

  it "valid if message is less than 50 char" do
    post = build(:post, message: "#{'a'*50}")
    expect(post).to be_valid
  end

  it "not valid if message is greater than 50 char" do
    post = build(:post, message: "#{'a'*51}")
    expect(post).to_not be_valid
  end

  # it "image and message can be attached to a post" do
  #   post = Post.new(message: "Test")
  #   post.image.attach(io: File.open("lib/assets/Scooby-Doo_test_picture.png"), 
  #   filename: "Scooby-Doo_test_picture.png", content_type: "image/png")

  #   expect(post.message).to eq('Test')
  #   expect(post.image.attached?).to be true
  #   expect(post.image.filename).to eq("Scooby-Doo_test_picture.png")
  #   expect(post).to be_valid
  # end

end
