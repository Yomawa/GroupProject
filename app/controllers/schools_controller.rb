class SchoolsController < ApplicationController
  before_action :is_admin, only: [:destroy, :edit, :update, :new]
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
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      @school = School.find(params[:id])
      format.html {@school}
      format.json {render json: @school}
    end    
          

  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    respond_to do |format|
      @school = School.find(params[:id])
      @school.update(school_params)
        format.html {
            if @school.save
              flash[:update] = "Updated"
              redirect_to schools_path(@school)
            else
              #redirect_to "/schools/#{@school.id}/edit"
              render :edit
            end }
      format.json {
        if @school.save
          render json: @school
        else 
          render json: {errors: @school.errors.full_messages}     
          
        end
      }
    end      
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    # flash[:destroy] = "Deleted"
    # redirect_to schools_path
    render json: 'Deleted'
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
