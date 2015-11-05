class ReviewsController < ApplicationController
    before_action :current_logged, only: [:new, :edit]
    before_action :oners_review, only: [:edit]
    before_action :delete_review, only: [:destroy]

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
    @review = @user.reviews.build(review_params)
    if @review.save
       flash[:create] = "Successfully Created"
       redirect_to school_path(@review.school_id)
    else
        flash[:create] = "can't be blank"
        redirect_to "/users/#{@user.id}/reviews/new?school_id=#{review_params[:school_id]}"
    end
  end

  def show
    @review = Review.find(params[:id])
    render json: @review
  end

  def edit
    @review = Review.find(params[:id])

  end

  def update
    respond_to do |format|
      @review = Review.find(params[:id])
      @review.update(review_params)
        format.html {
          if @review.save
            flash[:update] = "Updated"
            redirect_to school_path(@review.school_id)
          else
            render :edit
          end }
        format.json {
        if @review.save
          render json: @review
        else 
          render json: {errors: @review.errors.full_messages}
        end}
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # flash[:destroy] = "Your review has been deleted!"
    render json: "GGGRRRR"
    # redirect_to root_path
  end

  private

    def review_params
        params.require(:review).permit(
            :title,
            :description,
            :rating,
            :school_id
            )
    end

    def oners_review
      @review = Review.find(params[:id])
      if @review.user_id != current_user.id
      redirect_to root_path
      end
    end

    def delete_review
      @review = Review.find(params[:id])
      if !current_user.is_admin
          if @review.user_id != current_user.id
            redirect_to root_path
          end
      end
    end

    def current_logged
        unless session[:user_id]
            flash[:notice] = "Please login first"
            redirect_to login_path
        end
    end
end