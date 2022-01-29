require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = create(:like)
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it "a like is created with a post and user" do
    # expect(@like).to be_valid
    # expect(@like.likeable_type).to eq("Post")
    # user = User.find(@like.user_id)
    # expect(user).to be_instance_of(User)
  end

  it "increments the post's likes count by 1" do

  end

  context "a like is destroyed for a post" do
    it "decrements the post's likes by 1" do
    end
  end

  context "a duplicate like is created for a post and user" do
    it "raises an error" do
    end
  end
end
