class VotesController < ApplicationController
  before_action :pre_vote

  def upvote
    if @value.vote == 1
      @value.vote -= 1
    else
      @value.vote = 1
    end
    respond_to do |format|
      if @value.save
        @vote_total = Vote.group(:review_id).sum(:vote)
        format.json { render json: @vote_total[@review.id] }
      else
        flash[:error] = "You must be signed in"
      end
      format.html { redirect_to bookstore_path(@review.bookstore) }
    end
  end

  def downvote
    if @value.vote == -1
      @value.vote += 1
    else
      @value.vote = -1
    end
    respond_to do |format|
      if @value.save
        @vote_total = Vote.group(:review_id).sum(:vote)
        format.json { render json: @vote_total[@review.id] }
      else
        flash[:error] = "You must be signed in"
      end
      format.html { redirect_to bookstore_path(@review.bookstore) }
    end
  end

  protected

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
