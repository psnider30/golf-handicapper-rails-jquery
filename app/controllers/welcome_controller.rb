class WelcomeController < ApplicationController

  def home
    @golfer = current_golfer
    @golfers = Golfer.all
    @golf_courses = GolfCourse.all
    @low_round = Round.low_round_from_par
    @low_golfer = Golfer.lowest_index
  end
end
