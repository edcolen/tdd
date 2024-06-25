require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:blog_post) { create(:post) }
  let(:valid_attributes) { { body: 'A valid comment' } }
  let(:invalid_attributes) { { body: nil } }
  describe 'POST /create' do
    it 'creates a new Comment' do
      expect do
        post post_comments_path(blog_post), params: { comment: valid_attributes }
      end.to change(Comment, :count).by(1)
      expect(response).to redirect_to(post_path(blog_post))
    end
    it 'does not create a new Comment with invalid attributes' do
      expect do
        post post_comments_path(blog_post), params: { comment: invalid_attributes }
      end.not_to change(Comment, :count)
      expect(response).to render_template('posts/show')
    end
  end
end
