class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, message: '3文字以上'}
  validates :body, presence: true
end
