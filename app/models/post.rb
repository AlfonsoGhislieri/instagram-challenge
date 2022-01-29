class Post < ApplicationRecord
  validates :message, length: {maximum: 50}
  validates :image, presence: true
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
