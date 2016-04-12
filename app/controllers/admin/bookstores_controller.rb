class Admin::BookstoresController < AdminController
  def index
    @bookstores = Bookstore.all
  end

  def edit
    @bookstore = Bookstore.find(params[:id])
    @state_collection = Bookstore::STATES
    @reviews = @bookstore.reviews
  end

  def update
    @bookstore = Bookstore.find(params[:id])
    @bookstore.update(bookstore_params)
    if @bookstore.save
      flash[:notice] = "Bookstore updated successfully!"
      redirect_to admin_bookstores_path
    else
      flash[:error] = @bookstore.errors.full_messages.join", "
      render 'edit'
    end
  end

  def destroy
    Bookstore.find(params[:id]).destroy!
    flash[:notice] = "Bookstore deleted successfully."
    redirect_to admin_bookstores_path
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
    )
  end
end
