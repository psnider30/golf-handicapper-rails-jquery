class RoundsController < ApplicationController

  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def index
    @golfer = Golfer.find_by(id: params[:golfer_id])
    @rounds = @golfer.rounds
  end

  def show
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)

    if @round.save
      redirect_to golfer_round_path(current_golfer.id, @round.id), { notice: "Round of #{@round.score} at #{@round.golf_course} entered successfully."}
    else
      render 'rounds/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:score, :golfer_id, :golf_course_id)
  end
end
