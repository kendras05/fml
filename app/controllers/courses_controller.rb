class CoursesController < ApplicationController  

  def index
    @courses = Course.all
  end
  
  def show
  end
  
  def new
    if current_user && current_user.admin?
      @course = Course.new    
    else
      redirect_to(courses_path, alert: "You must be an admin to create a course.")
    end
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to(courses_path)
    else
      render(:new)
    end
  end
  
  def edit
    if current_user && current_user.admin?
      @course = Course.find(params[:id]) 
    else
      redirect_to(courses_path, alert: "You must be an admin to edit a course.")
    end
  end

  def update 
    @course= Course.find(params[:id])
    if @course.update(course_params)
      redirect_to(courses_path)
    else 
      render(:edit)
    end
  end
  
  def destroy
    if current_user && current_user.admin?
      @course = Course.find(params[:id])
      @course.destroy
      redirect_to(courses_path)
    else
      redirect_to(courses_path, alert: "You must be an admin to edit a course.")
    end
  end
  
  private

  def course_params
  params.require(:course).permit(:name)
  end

end
