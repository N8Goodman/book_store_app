class User < ApplicationRecord
  has_many :reviews
  has_many :votes
  has_many :bookstores
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, format: { with: /\w+@\w+\.\w+/ }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :user_name, presence: true, length: { in: 3..20, message: "User name must be between 3 and 20 characters." }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
end
