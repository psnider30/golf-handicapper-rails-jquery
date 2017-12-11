class GolfCourseCommentsController < ApplicationController

  def create
    golf_course_comment = GolfCourseComment.new(golf_course_comment_params)
    if golf_course_comment.save
      render json: golf_course_comment, status: 201
    end
  end

  def update
  end

  def destroy
    golf_course_comment = GolfCourseComment.find(params[:id])
    golf_course = GolfCourse.find(params[:golf_course_id])
    golf_course_comment.destroy
    redirect_to golf_course
  end

  private

  def golf_course_comment_params
    params.require(:golf_course_comment).permit(:content, :golfer_id, :golf_course_id)
  end

end
