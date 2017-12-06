class GolfCourseCommentsController < ApplicationController

  def create
    @golf_course_comment = GolfCourseComment.new(golf_course_comment_params)
    @golf_course = GolfCourse.find(params[:golf_course_id])
    if @golf_course_comment.save
      respond_to do |format|
        format.html { redirect_to @golf_course }
        format.json { render json: @golf_course_comment, status: 201 }
      end
    else
      redirect_to @golf_course
    end
  end

  def update
  end

  def destroy
  end

  private

  def golf_course_comment_params
    params.require(:golf_course_comment).permit(:content, :golfer_id, :golf_course_id)
  end

end
