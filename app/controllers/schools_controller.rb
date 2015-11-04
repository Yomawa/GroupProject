class SchoolsController < ApplicationController
  before_action :is_admin, only: [:destroy, :edit, :update]
  def index
    @schools = School.all
  end

  def new
    @school = School.new 
  end

  def create
    @school = School.create(school_params)
    #binding.pry
    if @school.save
      flash[:create] = "Successfully Created"
      redirect_to schools_path
    else
      render :new
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    #binding.pry
    if @school.save
      flash[:update] = "Updated"
      redirect_to schools_path(@school)
    else
      #redirect_to "/schools/#{@school.id}/edit"
      render :edit
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    flash[:destroy] = "Deleted"
    redirect_to schools_path
  end

  private 

  def is_admin
    if !current_user.is_admin
    redirect_to root_path
    end
  end

  def school_params
    params.require(:school).permit(:name, :logo, :webpage, :address, :description)
  end
end
