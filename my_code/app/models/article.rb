class Article < ApplicationRecord
  validates :content, presence: true
  validates :name, presence: true
end
