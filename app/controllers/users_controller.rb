class UsersController < ApplicationController
  before_action :go_home, only: [:signup]
  before_action :is_admin, only: [:admin, :destroy]
  before_action :my_profile, only: [:show]
  def signup
       @user = User.new 
  end

  def create
      @user = User.create(user_params)
      if @user.save
          session[:user_id] = @user.id
          flash[:notice] = "Welcome, you are now logged in!"
          redirect_to root_path
      else
          render :signup
      end
  end

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

  private
    def go_home
        if current_user 
            redirect_to root_path
        end
    end

  def is_admin
    if !current_user.is_admin
    redirect_to root_path
    end
  end

  def my_profile
    #binding.pry
    if current_user.id != params[:id].to_i
    redirect_to root_path
    end
  end

end
