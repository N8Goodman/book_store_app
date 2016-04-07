class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :vote, presence: true, inclusion: { in: ['up', 'down'] }
end
