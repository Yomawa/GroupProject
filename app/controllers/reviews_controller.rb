class ReviewsController < ApplicationController
    before_action :current_logged, only: [:new, :edit]

  def index
    @reviews = Review.all
  end

  def new
    @user = User.find(session[:user_id])
    @review = Review.new
    @school = School.find(params[:school_id])
  end

  def create
    @user = User.find(session[:user_id])
    @review = @User.reviews.build(review_params)
    if @review.save
       flash[:create] = "You create a new review!"
       redirect_to school_path(review.school)
    else
        render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.save
        flash[:update] = "Your review has been updated!"
        redirect_to review_path(@review)
    else
        render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:destroy] = "Your review has been deleted!"
    redirect_to root_path
  end

  private

    def review_params
        params.require(:review).permit(
            :title,
            :description,
            :rating
            )
    end

    def current_logged
        unless session[:user_id]
            flash[:notice] = "Please login first"
            redirect_to login_path
        end
    end
end