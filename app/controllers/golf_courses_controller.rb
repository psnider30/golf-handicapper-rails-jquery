class GolfCoursesController < ApplicationController

  before_action :set_golf_course, only: [:show, :edit, :update, :destroy]

  def index
    @golf_courses = GolfCourse.all
  end

  def show
    set_golf_course
  end

  def new
    @golf_course = GolfCourse.new
  end

  def create
    @golf_course = GolfCourse.new(golf_course_params)
  end

  def edit
  end

  def update
    if @golf_course.update(golf_course_params)
      redirect_to @golf_course, { notice: 'golf course updated successfully.' }
    else
      render 'edit'
    end
  end

  def destroy
    @golf_course.destroy
    redirect_to golf_courses_path, { notice: 'golf course deleted!' }
  end

  private

  def set_golf_course
    @golf_course = GolfCourse.find(params[:id])
  end

  def golf_course_params
    params.require(:golf_course).permit(:name, :description, :holes, :total_par, :course_slope, :course_rating)
  end
end
