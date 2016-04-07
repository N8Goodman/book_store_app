class User < ApplicationRecord
  has_many :reviews
  has_many :bookstores
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, format: { with: /\w+@\w+\.\w+/ }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :user_name, presence: true, length: { minimum: 3, too_short:
  "User name must have at least 3 characters." }, length: { maximum: 20, too_long:
  "User name can have a maximum of 20 characters." }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
end
