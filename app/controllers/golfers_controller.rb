class GolfersController < ApplicationController

  before_action :authenticate_user
  after_action :unmemoize_golfer_variables, only: [:create, :update, :destroy]

  def index
    @golfers = Golfer.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @golfers }
    end
  end

  def show
    @last_golfer_id = Golfer.last.id
    @first_golfer_id = Golfer.first.id
    @golfer = Golfer.find(params[:id])
    @rounds_desc = @golfer.rounds.order(created_at: :desc)

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @golfer }
    end
  end

  def destroy
    can_delete_profile
    @golfer = Golfer.find(params[:id])
    Round.where(golfer_id: @golfer.id).destroy_all
    GolfCourseComment.where(golfer_id: @golfer.id).destroy_all
    @golfer.destroy
  end

  private

  def can_delete_profile
    redirect_to root_url unless current_golfer.id == params[:id]
  end

  def unmemoize_golfer_variables
    Golfer.unmemoize_class_methods_variables
  end

end
