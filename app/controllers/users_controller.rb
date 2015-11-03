class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def admin
    @schools = School.all
    @users = User.all
    @reviews = Review.all 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:destroy]= "Deleted"
    redirect_to admin_path
  end
end
