require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  it 'is valid with a body and post' do
    expect(comment).to be_valid
  end

  it 'is invalid without a body' do
    comment.body = nil
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end

  it 'is invalid without a post' do
    comment.post = nil
    comment.valid?
    expect(comment.errors[:post]).to include('must exist')
  end
end
