class ResetsController < ApplicationController
  def new
  end

  def create
     user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      Reset.password_reset(user).deliver_now
      redirect_to login_path, notice: "Email sent"
    else
      flash.now[:alert] = "Email not found"
      render :new
    end
  end

  def edit
    @user = User.find_by(reset_token: params[:id])
  end

  def update
    @user = User.find_by(reset_token: params[:id])
      if params[:user][:password].present?
        if @user && @user.update(user_params)
          @user.update(reset_token: nil)
          session[:user_id] = @user.id 
          redirect_to home_path, flash: {success: "Password updated."}
        else 
          flash.now[:notice] = "We're sorry! Password Reset Error. Please try again"
          render :edit
        end
      else 
        flash.now[:alert] = "Please Enter a Password"
        render :edit
      end
  end

  def user_params
    params.require(:user).permit(:password)
  end
end
