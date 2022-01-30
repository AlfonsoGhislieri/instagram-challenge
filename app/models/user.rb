class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  after_commit :add_default_avatar, on: %i[create update]

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open('app/assets/images/default_avatar.png'), 
        filename: 'default_avatar.png', content_type: 'image/png')
    end
  end
end
