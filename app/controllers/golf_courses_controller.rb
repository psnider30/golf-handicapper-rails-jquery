class GolfCoursesController < ApplicationController

  before_action :set_golf_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  after_action :unmemoize_golf_course_variables, only: [:create, :update, :destroy]

  def index
    @golf_courses = GolfCourse.all
  end

  def show
    @round = Round.new
    @golf_course_comment = GolfCourseComment.new
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @golf_course }
    end
  end

  def new
    @golf_course = GolfCourse.new
  end

  def create
    @golf_course = GolfCourse.new(golf_course_params)
    if @golf_course.save
      redirect_to @golf_course, { notice: 'golf course created successfully.' }
    else
      render 'golf_courses/new'
    end
  end

  def edit
  end

  def update
    if @golf_course.update(golf_course_params)
      redirect_to @golf_course, { notice: 'golf course updated successfully.' }
    else
      render 'golf_courses/edit'
    end
  end

  def destroy
    authenticate_admin
    Round.where(golf_course_id: @golf_course.id).destroy_all
    GolfCourseComment.where(golf_course_id: @golf_course.id).destroy_all
    GolfCourseTag.where(golf_course_id: @golf_course.id).destroy_all
    @golf_course.destroy
    redirect_to golf_courses_path, { notice: 'golf course deleted!' }
  end

  private

  def set_golf_course
    @golf_course = GolfCourse.find(params[:id])
  end

  def golf_course_params
    params.require(:golf_course).permit(:name, :description, :holes, :total_par, :course_slope,
      :course_rating, tag_ids: [], tags_attributes: [:name], golf_course_comments_attributes: [:content, :golfer_id])
  end

  def unmemoize_golf_course_variables
    GolfCourse.unmemoize_class_methods_variables
    Golfer.unmemoize_class_methods_variables
    Round.unmemoize_class_methods_variables
  end

end
