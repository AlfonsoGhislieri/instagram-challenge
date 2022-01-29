require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = create(:like)
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:likeable) }
  end

  it "a like is created with a post and user" do
    expect(@like).to be_valid
    expect(@like.likeable_type).to eq("Post")

    post = Post.find(@like.likeable_id)
    user = User.find(@like.user_id)

    expect(post).to be_instance_of(Post)
    expect(user).to be_instance_of(User)
  end

  it "increments the post's likes count by 1" do
    post = Post.find(@like.likeable_id)
    expect(post.likes.length).to eq(1)
  end

  it "decrements the post's likes by 1 if comment destroyed" do
    post = Post.find(@like.likeable_id)
    @like.destroy
    expect(post.likes.length).to eq(0)
  end

  it "raises an error for a duplicate like" do
    like = Like.create(likeable: Post.find(@like.likeable_id), user: User.find(@like.user_id))
    expect(like).to_not be_valid
  end
end
