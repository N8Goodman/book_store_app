class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_user && current_user.admin?
      flash[:notice] = "Access denied!"
      redirect_to root_path
    end
  end
end
