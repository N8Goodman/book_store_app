class VotesController < ApplicationController
  private

  def already_downvoted?
    Downvote.where(user: current_user).where(review: review).first.present?
  end

  def existing_downvote
    Downvote.where(user: current_user).where(review: review).first
  end

  def already_upvoted?
    Upvote.where(user: current_user).where(review: review).first.present?
  end

  def existing_upvote
    Upvote.where(user: current_user).where(review: review).first
  end

  def upvote
    Upvote.new(user: current_user, review: review)
  end

  def downvote
    Downvote.new(user: current_user, review: review)
  end

  def review
    Review.find(params[:review_id])
  end

  def bookstore
    review.bookstore
  end

  def count_votes(review)
    down = review.downvotes.length
    up = review.upvotes.length
    sum = up - down
    review.count = sum
    review.save
  end
end
