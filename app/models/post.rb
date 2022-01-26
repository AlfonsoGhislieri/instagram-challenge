class Post < ApplicationRecord
  validates :message, length: {maximum: 50}
  validates :image, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
end
