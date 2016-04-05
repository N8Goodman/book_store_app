class Bookstore < ActiveRecord::Base
  STATES = [
    ["Massachusetts", "MA"],
    ["New Hampshire", "NH"],
    ["Connecticut", "CT"],
    ["Maine", "ME"]
  ]

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, numericality: {integer: true}, length: {is: 5}
end
