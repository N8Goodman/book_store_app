class Review < ActiveRecord::Base
  RATINGS = [
    [1,1],
    [2,2],
    [3,3],
    [4,4],
    [5,5]
  ]

  belongs_to :bookstore

  validates :bookstore, presence: true
  validates :user, presence: true
  validates :overall_rating, presence: true, numericality: {integer: true}, inclusion: {in: 1..5}
  validates :price_rating, presence: true, numericality: {integer: true}, inclusion: {in: 1..5}
  validates :variety_rating, presence: true, numericality: {integer: true}, inclusion: {in: 1..5}
  validates :customer_service_rating, presence: true, numericality: {integer: true}, inclusion: {in: 1..5}
  validates :customer_service_rating, numericality: {integer: true}, inclusion: {in: 1..5}, allow_nil: true
  validates :beverage_rating, numericality: {integer: true}, inclusion: {in: 1..5}, allow_nil: true
  validates :food_rating, numericality: {integer: true}, inclusion: {in: 1..5}, allow_nil: true
  validates :atmosphere_rating, numericality: {integer: true}, inclusion: {in: 1..5}, allow_nil: true

end
