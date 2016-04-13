class BookstoresController < ApplicationController
  def index
    @bookstores = Kaminari.paginate_array(Bookstore.search(params[:search])).page(params[:page])
  end

  def show
    @bookstore = Bookstore.find(params[:id])
    @rating_collection = Review::RATINGS
    @review = Review.new
    @reviews = @bookstore.reviews.order(:count).page params[:page]
    @vote_total = Vote.group(:review_id).sum(:vote)
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

        message = "#{@bookstore.name}, #{@bookstore.city}, "
        message += "#{@bookstore.state} was just added! Check it out at: "
        message += "literalist.herokuapp.com/bookstores/#{@bookstore.id}"

        @twitter_client ||= TwitterClient.new
        @twitter_client.post_tweet(message)
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
    @bookstore = Bookstore.find(params[:id])
    if current_user && current_user == @bookstore.user || current_user.admin
      @state_collection = Bookstore::STATES
    elsif current_user
      flash[:error] =
        "You must be the bookstore creator to edit this information"
      redirect_to bookstore_path(@bookstore)
    else
      flash[:error] = "You must be signed in!"
      redirect_to bookstore_path(@bookstore)
    end
  end

  def update
    @bookstore = Bookstore.find(params[:id])
    if current_user && current_user == @bookstore.user || current_user.admin
      @bookstore.update(bookstore_params)
      if @bookstore.save
        flash[:notice] = "Bookstore updated!"
        redirect_to bookstore_path(@bookstore)
      else
        flash[:error] = @bookstore.errors.full_messages.join", "
        render 'edit'
      end
    elsif current_user
      flash[:error] =
        "You must be the bookstore creator to edit this information"
      render 'show'
    else
      flash[:error] = "You must be signed in!"
      redirect_to bookstore_path(@bookstore)
    end
  end

  def destroy
    @bookstore = Bookstore.find(params[:id])
    if current_user && current_user == @bookstore.user || current_user.admin
      if @bookstore.destroy!
        flash[:notification] = "Bookstore removed!"
        redirect_to bookstores_path
      else
        @bookstore.errors.full_messages.join", "
        redirect_to bookstore_path(@bookstore)
      end
    elsif current_user
      flash[:error] =
        "You must be the bookstore creator to edit this information"
      redirect_to bookstores_path(@bookstore)
    else
      flash[:error] = "You must be signed in!"
      redirect_to bookstore_path(@bookstore)
    end
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
