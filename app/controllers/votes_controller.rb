class VotesController < ApplicationController
  before_action :pre_vote

  def upvote
    if @value.vote == 1
      @value.vote -= 1
    else
      @value.vote = 1
    end
    if @value.save
      @vote_total = Vote.group(:review_id).sum(:vote)
      flash[:notice] = "Vote added!"
    else
      flash[:error] = "You must be signed in"
    end
    redirect_to bookstore_path(@review.bookstore)
  end

  def downvote
    if @value.vote == -1
      @value.vote += 1
    else
      @value.vote = -1
    end
    if @value.save
      @vote_total = Vote.group(:review_id).sum(:vote)
      flash[:notice] = "Vote added!"
    else
      flash[:error] = "You must be signed in"
    end
    redirect_to bookstore_path(@review.bookstore)
  end

  protected

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
