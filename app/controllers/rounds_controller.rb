class RoundsController < ApplicationController

  before_action :set_golf_course, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_round
    @round = ROund.find(params:round_id)
  end

  def round_params
    params.require(:round).permit(:score, :golfer_id, :golf_course_id)
  end
end
