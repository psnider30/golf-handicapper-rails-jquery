class RoundsController < ApplicationController

  before_action :set_round, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  after_action :unmemoize_round_variables, only: [:create, :update, :destroy]

  def index
    if params[:golf_course_id]
      @golf_course = GolfCourse.find_by(id: params[:golf_course_id])
      @golf_course_rounds = @golf_course.rounds
      render 'rounds/golf_course_rounds_index'
    end
  end

  def show
  end

  def new
    @round = Round.new
    @golf_course = GolfCourse.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to golfer_round_path(current_golfer.id, @round.id), { notice: "Round of #{@round.score} at #{@round.golf_course.name}
       by #{@round.golfer.name} entered successfully." }
    else
      @golf_course = GolfCourse.new
      render 'rounds/new'
    end
  end

  def edit
    authenticate_owner(@round)
    @golf_course = @round.golf_course
  end

  def update
    authenticate_owner(@round)
    if @round.update(round_params)
      redirect_to golfer_round_path(current_golfer.id, @round.id), { notice: "Round of #{@round.score} at #{@round.golf_course.name}
       by #{@round.golfer.name} updated successfully." }
    else
      render 'rounds/edit'
    end
  end

  def destroy
    authenticate_owner(@round)
    @golfer = Golfer.find_by(id: params[:golfer_id])
    @round.destroy
    redirect_to @golfer
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:score, :golfer_id, :golf_course_id,
      golf_course_attributes: [:name, :description, :holes, :total_par, :course_slope, :course_rating,
        tags_attributes: [:name], golf_course_comments_attributes: [:content, :golfer_id]])
  end

  def unmemoize_round_variables
    Round.unmemoize_class_methods_variables
    GolfCourse.unmemoize_class_methods_variables
    Golfer.unmemoize_class_methods_variables
  end
end
