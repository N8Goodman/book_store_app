class Admin::ReviewsController < AdminController

  def destroy
    @review = Review.find(params[:id])
    @bookstore = @review.bookstore
    @review.destroy!
    flash[:notice] = "Review deleted successfully."
    redirect_to edit_admin_bookstore_path(@bookstore)
  end
end
