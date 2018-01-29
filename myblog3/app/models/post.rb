class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  paginates_per 25
  has_many :comments

  validates :title, presence: true, length: { minimum: 3, message: '3文字以上'}
  validates :title, presence: true

  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
end
