class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, message: 'minimum is 3 characters'}
  validates :body, presence: true
end
