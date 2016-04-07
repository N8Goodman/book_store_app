class UpvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @bookstore = @review.bookstore
    @reviews = @bookstore.reviews
    @rating_collection = Review::RATINGS
    @existing_down = Downvote.where(user: current_user).where(review: @review)
    @existing_up = Upvote.where(user: current_user).where(review: @review)
    if current_user
      if !@existing_up.empty?
        flash[:error] = "You have already voted!"
      elsif !@existing_down.empty?
        @existing_down.first.destroy!
        @vote = Upvote.new(user: current_user, review: @review)
        if @vote.save
          flash[:notice] = "Vote Changed!"
        else
          flash[:error] = @vote.errors.full_messages.join", "
        end
      else
        @vote = Upvote.new(user: current_user, review: @review)
        if @vote.save
          flash[:notice] = "Vote Added!"
        else
          flash[:error] = @vote.errors.full_messages.join", "
        end
      end
    else
      flash[:error] = "You must be signed in to vote!"
    end
    count_votes(@review)
    redirect_to bookstore_path(@review.bookstore)
  end

  private

  def count_votes(review)
    down = review.downvotes.length
    up = review.upvotes.length
    sum = up - down
    review.count = sum
    review.save
  end
end
