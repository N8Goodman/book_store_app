class ReviewsController < ApplicationController
  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to bookstore_path(@bookstore)
    else
      flash[:error] = @review.errors.full_messages.join", "
      @reviews = @bookstore.reviews
      @rating_collection = Review::RATINGS
      render :'bookstore/show'
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
