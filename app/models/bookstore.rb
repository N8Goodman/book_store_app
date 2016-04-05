class Bookstore < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, numericality: {integer: true, length: 5}
end
