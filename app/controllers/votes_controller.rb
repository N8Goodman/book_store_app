class VotesController < ApplicationController
  before_action :check_sign_in

  def upvote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_create_by(review: @review, user: current_user)
    if @value.vote == 1
      @value.update_attributes(vote: 0)
    else
      @value.update_attributes(vote: 1)
    end
      @vote_total = Vote.group(:review_id).sum(:vote)
      redirect_to bookstore_path(@review.bookstore)
  end

  def downvote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_create_by(review: @review, user: current_user)
    if @value.vote == -1
      @value.update_attributes(vote: 0)
    else
      @value.update_attributes(vote: -1)
    end
      @vote_total = Vote.group(:review_id).sum(:vote)
      redirect_to bookstore_path(@review.bookstore)
  end

  def check_sign_in
    @review = Review.find(params[:review_id])
    @bookstore = @review.bookstore
    unless current_user
      flash[:notice] = "You must be signed in to vote!"
      redirect_to @bookstore
    end
  end
end
