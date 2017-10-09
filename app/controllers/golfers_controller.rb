class GolfersController < ApplicationController
  def index
    @golfers = Golfer.all
  end

  def show
    @golfer = Golfer.find(params[:id])
  end
end
