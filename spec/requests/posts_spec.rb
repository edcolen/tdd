require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:blog_post) { create(:post) }
  let(:valid_attributes) { attributes_for(:post) }
  let(:invalid_attributes) { { title: nil, body: nil } }

  describe 'GET /index' do
    it 'returns http success' do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates a new Post' do
      expect do
        post posts_path, params: { post: valid_attributes }
      end.to change(Post, :count).by(1)
      expect(response).to redirect_to(Post.last)
    end
    it 'does not create a new Post with invalid attributes' do
      expect do
        post posts_path, params: { post: invalid_attributes }
      end.not_to change(Post, :count)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      allow(Post).to receive(:find).with(blog_post.id.to_s).and_return(blog_post)
      get post_path(blog_post)
      expect(response).to have_http_status(:success)
    end
  end
end
