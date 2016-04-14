class Admin::ReviewsController < AdminController
  def destroy
    @review = Review.find(params[:id])
    @bookstore = @review.bookstore
    if @review
       @review.destroy!
    flash[:notice] = "Review deleted successfully."
    else
    flash[:notice] = "Failed! Review not found."
    end
    redirect_to edit_admin_bookstore_path(@bookstore)
  end
end
