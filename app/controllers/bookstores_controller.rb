class BookstoresController < ApplicationController
  def index
    @bookstores = Bookstore.all
  end

  def show
    @bookstore = Bookstore.find(params[:id])
    @rating_collection = Review::RATINGS
    @review = Review.new
    @reviews = @bookstore.reviews
  end

  def new
    if current_user
      @state_collection = Bookstore::STATES
      @bookstore = Bookstore.new
    else
      flash[:error] = "You must be signed in to add Bookstores!"
      redirect_to new_user_registration_path
    end
  end

  def create
    if current_user
      @state_collection = Bookstore::STATES
      @bookstore = Bookstore.new(bookstore_params)
      if @bookstore.save
        flash[:notice] = "Bookstore successfully added!"
        @bookstore.tweet
        redirect_to bookstore_path(@bookstore)
      else
        flash[:error] = @bookstore.errors.full_messages.join", "
        render :new
      end
    else
      flash[:error] = "You must be signed in to add Bookstores!"
      redirect_to new_user_registration_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bookstore_params
    params.require(:bookstore).permit(
      :name,
      :address,
      :city,
      :state,
      :zip_code,
      :description,
      :url,
      :img_url,
      :beverage,
      :food
    ).merge(user: current_user)
  end
end
