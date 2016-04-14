class Admin::ReviewsController < AdminController
  def destroy
    @review = Review.find(params[:id])
    @bookstore = @review.bookstore
    if @review
       @review.destroy!
    flash[:notice] = "Review deleted successfully."
    redirect_to edit_admin_bookstore_path(@bookstore)
  else
    flash[:notice] = "Failed!"
    render: "admin/bookstores#edit"
    end
  end
end
