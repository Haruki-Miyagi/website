class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3, message: 'minimum is 3 characters'}
  validates :body, presence: true
end
