class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted successfully."
    redirect_to admin_users_path
  end

  def require_admin
    unless current_user.admin?
      flash[:notice] = "Access denied!"
      redirect_to root_path
    end
  end
end
