class ReviewsController < ApplicationController
  def create
    @bookstore = Bookstore.find(params[:bookstore_id])
    @reviews = @bookstore.reviews
    @review = Review.new(review_params)
    if current_user
      if @review.save
        NotifierMailer.review_added_email(@review).deliver_later

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
