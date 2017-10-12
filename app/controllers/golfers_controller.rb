class GolfersController < ApplicationController

  before_action :authenticate_user

  def index
    @golfers = Golfer.all
  end

  def show
    @golfer = Golfer.find(params[:id])
  end

end
