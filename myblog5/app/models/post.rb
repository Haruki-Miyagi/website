class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 3, message: '3文字以上！'}
  validates :body, presence: true
end
