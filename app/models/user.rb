class User < ApplicationRecord
  has_many :reviews
  has_many :upvotes
  has_many :downvotes
  has_many :bookstores
  has_many :reviews, dependent: :destroy
  has_many :bookstores, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, format: { with: /\w+@\w+\.\w+/ }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :user_name, presence: true, length: { in: 3..20, message: "User name must be between 3 and 20 characters." }
  validate :avatar_size_validation

  mount_uploader :avatar, ImageUploader
  
  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
end
