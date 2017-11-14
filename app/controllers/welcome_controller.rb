class WelcomeController < ApplicationController

  def home
    @golfer = current_golfer
    @golfers = Golfer.all
    @golf_courses = GolfCourse.all
    @low_round_gross = Round.low_round_from_par
    @low_round_net = Round.low_round_net
    @low_golfer = Golfer.lowest_index
  end
end
