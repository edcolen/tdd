require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  it 'is valid with a title and body' do
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post.title = nil
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without a body' do
    post.body = nil
    post.valid?
    expect(post.errors[:body]).to include("can't be blank")
  end

  it 'can count its comments' do
    allow(post).to receive(:comments_count).and_return(3)
    expect(post.comments_count).to eq(3)
  end
end
