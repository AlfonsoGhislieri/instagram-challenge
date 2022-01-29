class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type], message: "already liked this" }
   
  belongs_to :user
  belongs_to :likeable, polymorphic: true
end
