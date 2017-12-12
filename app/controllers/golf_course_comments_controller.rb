class GolfCourseCommentsController < ApplicationController

  def create
    golf_course_comment = GolfCourseComment.new(golf_course_comment_params)
    if golf_course_comment.save
      render json: golf_course_comment, status: 201
    end
  end

  def edit
    golf_course = GolfCourse.find(params[:golf_course_id])
    golf_course_comment = GolfCourseComment.find(params[:id])
    render 'golf_courses/_golf_course_comment',
    locals: { golf_course_comment: golf_course_comment, golf_course: golf_course }
  end

  def update
    golf_course = GolfCourse.find(params[:golf_course_id])
    golf_course_comment = GolfCourseComment.find(params[:id])
    if golf_course_comment.update(golf_course_comment_params)
      redirect_to golf_course, { notice: 'comment updated successfuly'}
    else
      render 'golf_courses/_golf_course_comment',
      locals: { golf_course_comment: golf_course_comment, golf_course: golf_course }
    end
  end

  def destroy
    golf_course_comment = GolfCourseComment.find(params[:id])
    golf_course = GolfCourse.find(params[:golf_course_id])
    golf_course_comment.destroy
    render json: golf_course_comment
  end

  private

  def golf_course_comment_params
    params.require(:golf_course_comment).permit(:content, :golfer_id, :golf_course_id)
  end

end
