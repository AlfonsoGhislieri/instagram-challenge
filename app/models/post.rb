class Post < ApplicationRecord
  validates :message, presence: true, length: {maximum: 50}
  belongs_to :user
end
