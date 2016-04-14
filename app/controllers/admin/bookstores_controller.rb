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
    @bookstore = Bookstore.find(params[:id])
    if @bookstore
      @bookstore.destroy!
    flash[:notice] = "Bookstore deleted successfully."
    redirect_to admin_bookstores_path
    else
      flash[:notice] = "Failed! Bookstore not found."
    render :index
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
    )
  end
end
