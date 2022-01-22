require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it "not valid if post has neither a message or a image" do
    post = Post.new()

    expect(post).to_not be_valid
  end

  it "not valid if just message" do
    post = Post.new(message: "This is my first post")

    expect(post).to_not be_valid
  end

  it "message is less than 50 char" do
    post = Post.new(message: "a" * 50)

    expect(post).to be_valid
  end


  it "message is greater than 50 char" do
    post = Post.new(message: "a" * 51)
    expect(post).to_not be_valid
  end

  it "image and message can be attached to a post" do
    post = Post.new(message: "Test")
    post.image.attach(io: File.open("lib/assets/Scooby-Doo_test_picture.png"), 
    filename: "Scooby-Doo_test_picture.png", content_type: "image/png")

    expect(post.message).to eq('Test')
    expect(post.image.attached?).to be true
    expect(post.image.filename).to eq("Scooby-Doo_test_picture.png")
    expect(post).to be_valid
  end

end
