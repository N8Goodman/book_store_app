class ReviewsController < ApplicationController
  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    @reviews = @bookstore.reviews
    @review = Review.new(review_params)
    if current_user
      if @review.save
        flash[:notice] = "Review successfully added!"
        redirect_to bookstore_path(@bookstore)
      else
        flash[:error] = @review.errors.full_messages.join", "
        @rating_collection = Review::RATINGS
        render :'bookstores/show'
      end
    else
      @rating_collection = Review::RATINGS
      flash[:error] = "You must be signed in to add reviews!"
      render :'bookstores/show'
    end
  end

  def upvote
    @review = Review.find(params[:review_id])
    @bookstore = @review.bookstore
    @reviews = @bookstore.reviews
    @rating_collection = Review::RATINGS
    @existing = Vote.where(user: current_user).where(review: @review)
    if !@existing.empty?
      if current_user && @existing.first.vote != 'up'
        @existing.first.update(user: current_user, review: @review, vote: 'up')
        if @existing.first.save
          @review.count += 2
          @review.save
          flash[:notice] = "Vote updated!"
          redirect_to bookstore_path(@review.bookstore)
        else
          flash[:error] = @existing.first.errors.full_messages.join", "
          render 'bookstores/show'
        end
      elsif current_user && @existing.first.vote == 'up'
        flash[:error] = "You have already voted!"
        render 'bookstores/show'
      end
    elsif current_user
      @vote = Vote.new(user: current_user, review: @review, vote: 'up')
      if @vote.save
        @review.count += 1
        @review.save
        flash[:notice] = "Vote Added!"
        redirect_to bookstore_path(@review.bookstore)
      else
        flash[:error] = @vote.errors.full_messages.join", "
        render 'bookstores/show'
      end
    else
      flash[:error] = "You must be signed in to vote!"
      render 'bookstores/show'
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    @bookstore = @review.bookstore
    @reviews = @bookstore.reviews
    @rating_collection = Review::RATINGS
    @existing = Vote.where(user: current_user).where(review: @review)
    if !@existing.empty?
      if current_user && @existing.first.vote != 'down'
        @existing.first.update(user: current_user, review: @review, vote: 'down')
        if @existing.first.save
          @review.count -= 2
          @review.save
          flash[:notice] = "Vote updated!"
          redirect_to bookstore_path(@review.bookstore)
        else
          flash[:error] = @existing.first.errors.full_messages.join", "
          render 'bookstores/show'
        end
      elsif current_user && @existing.first.vote == 'down'
        flash[:error] = "You have already voted!"
        render 'bookstores/show'
      end
    elsif current_user
      @vote = Vote.new(user: current_user, review: @review, vote: 'down')
      if @vote.save
        @review.count -= 1
        @review.save
        flash[:notice] = "Vote Added!"
        redirect_to bookstore_path(@review.bookstore)
      else
        flash[:error] = @vote.errors.full_messages.join", "
        render 'bookstores/show'
      end
    else
      flash[:error] = "You must be signed in to vote!"
      render 'bookstores/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(
      :overall_rating,
      :price_rating,
      :variety_rating,
      :customer_service_rating,
      :beverage_rating,
      :food_rating,
      :atmosphere_rating,
      :body
    ).merge(bookstore: @bookstore, user: current_user)
  end
end
