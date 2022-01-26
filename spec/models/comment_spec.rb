require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = create(:comment)
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it "valid if has both text and linked user id and post id" do
    expect(@comment).to be_valid
  end

end
