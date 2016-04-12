class ReviewsController < ApplicationController
  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    @reviews = @bookstore.reviews
    @review = Review.new(review_params)
    if current_user && @review.save
      flash[:notice] = "Review successfully added!"
    elsif current_user
      flash[:error] = @review.errors.full_messages.join", "
      @rating_collection = Review::RATINGS
    else
      @rating_collection = Review::RATINGS
      flash[:error] = "You must be signed in to add reviews!"
    end
    redirect_to bookstore_path(@bookstore)
  end

  def edit
    @review = Review.find(params[:id])
    @bookstore = @review.bookstore
    if current_user && current_user == @review.user || current_user.admin
      @rating_collection = Review::RATINGS
    elsif current_user
      flash[:error] = "You must be the review creator to edit this information"
      redirect_to bookstore_path(@bookstore)
    else
      flash[:error] = "You must be signed in!"
      redirect_to bookstore_path(@bookstore)
    end
  end

  def update
    @review = Review.find(params[:id])
    @bookstore = @review.bookstore
    @rating_collection = Review::RATINGS
    if current_user && current_user == @review.user || current_user.admin
      @review.update(review_params)
      if @review.save
        flash[:notice] = "Review updated!"
        redirect_to bookstore_path(@bookstore)
      else
        flash[:error] = @review.errors.full_messages.join", "
        render 'edit'
      end
    elsif current_user
      flash[:error] = "You must be the review creator to edit this information"
      redirect_to bookstore_path(@bookstore)
    else
      flash[:error] = "You must be signed in!"
      redirect_to bookstore_path(@bookstore)
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @bookstore = @review.bookstore
    if current_user && current_user == @review.user || current_user.admin
      if @review.destroy!
        flash[:notification] = "Review removed!"
      else
        @bookstore.errors.full_messages.join", "
      end
    elsif current_user
      flash[:error] = "You must be the review creator to edit this information"
    else
      flash[:error] = "You must be signed in!"
    end
    redirect_to bookstore_path(@bookstore)
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
