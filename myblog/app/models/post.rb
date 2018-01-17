class Post < ApplicationRecord
  paginates_per 10  # 1ページあたり5項目表示
  has_many :comments, dependent: :destroy
  #@post.comments
  validates :title, presence: true, length: { minimum: 3, message: 'Too short to post!' }
  validates :body, presence: true
end
