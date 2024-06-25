class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def comments_count
    comments.count
  end
end
