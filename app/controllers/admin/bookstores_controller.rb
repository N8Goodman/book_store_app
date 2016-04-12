class Admin::BookstoresController < AdminController

  def index
    @bookstores = Bookstore.all
  end

  def destroy
    Bookstore.find(params[:id]).destroy
    flash[:notice] = "Bookstore deleted successfully."
    redirect_to admin_bookstores_path
  end
end
