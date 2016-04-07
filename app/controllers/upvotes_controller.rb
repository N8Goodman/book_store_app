class UpvotesController < VotesController
  def create
    if current_user
      if already_upvoted?
        flash[:error] = "You have already voted!"
      elsif already_downvoted?
        (already_downvoted).destroy!
        if upvote.save
          flash[:notice] = "Vote Changed!"
        else
          flash[:error] = @vote.errors.full_messages.join", "
        end
      else
        if upvote.save
          flash[:notice] = "Vote Added!"
        else
          flash[:error] = @vote.errors.full_messages.join", "
        end
      end
    else
      flash[:error] = "You must be signed in to vote!"
    end
    count_votes(review)
    redirect_to bookstore_path(bookstore)
  end
end
