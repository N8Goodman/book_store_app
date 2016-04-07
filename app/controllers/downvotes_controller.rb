class DownvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @bookstore = @review.bookstore
    @reviews = @bookstore.reviews
    @rating_collection = Review::RATINGS
    @existing_down = Downvote.where(user: current_user).where(review: @review)
    @existing_up = Upvote.where(user: current_user).where(review: @review)
    if current_user
      if !@existing_down.empty?
        count_votes(@review)
        flash[:error] = "You have already voted!"
        redirect_to bookstore_path(@review.bookstore)
      elsif !@existing_up.empty?
        @existing_up.first.destroy!
        @vote = Downvote.new(user: current_user, review: @review)
        if @vote.save
          flash[:notice] = "Vote Changed!"
          count_votes(@review)
          redirect_to bookstore_path(@review.bookstore)
        else
          count_votes(@review)
          flash[:error] = @vote.errors.full_messages.join", "
          redirect_to bookstore_path(@review.bookstore)
        end
      else
        @vote = Downvote.new(user: current_user, review: @review)
        if @vote.save
          flash[:notice] = "Vote Added!"
          count_votes(@review)
          redirect_to bookstore_path(@review.bookstore)
        else
          flash[:error] = @vote.errors.full_messages.join", "
          count_votes(@review)
          redirect_to bookstore_path(@review.bookstore)
        end
      end
    else
      count_votes(@review)
      flash[:error] = "You must be signed in to vote!"
      redirect_to bookstore_path(@review.bookstore)
    end
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
