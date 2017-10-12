class GolfersController < ApplicationController

  before_action :authenticate_user

  def index
    @golfers = Golfer.all
  end

  def show
    @golfer = Golfer.find(params[:id])
  end

  def destroy
    can_delete_profile
    @golfer = Golfer.find(params[:id])
    Round.where(golfer_id: @golfer.id).destroy_all
    @golfer.destroy
  end

  private

  def can_delete_profile
    redirect_to root_url unless current_golfer.id == params[:id]
  end
end
