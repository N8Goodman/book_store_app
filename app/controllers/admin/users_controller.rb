class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.admin
      @user.update_attributes(admin: false)
      flash[:notice] = "#{@user.user_name} is no longer an admin."
    else
      @user.update_attributes(admin: true)
      flash[:notice] = "#{@user.user_name} is now an admin."
    end
    redirect_to admin_users_path
  end

  def destroy
    if User.find(params[:id])
      User.find(params[:id]).destroy!
    flash[:notice] = "User deleted successfully."
    redirect_to admin_users_path
    else
      flash[:notice] = "Failed! User not found."
      render :index
    end
  end
end
