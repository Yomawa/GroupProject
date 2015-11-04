class UsersController < ApplicationController
  def index
  end

  def show
     @user = User.find(params[:id])
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
    # flash[:destroy]= "Deleted"
    # redirect_to admin_path
    render json: "Deleted"
  end
end
