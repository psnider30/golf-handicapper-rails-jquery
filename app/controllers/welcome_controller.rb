class WelcomeController < ApplicationController

  def home
    @golfer = current_golfer
    @golfers = Golfer.all
    @easiest_course = GolfCourse.lowest_course_slope
    @hardest_course = GolfCourse.highest_course_slope
    @low_round_gross = Round.low_round_from_par
    @low_golfer = Golfer.lowest_index
    @low_round_net = Round.low_round_net
  end
end

#<h4>Net Low Round: Score of <%= @low_round_net.score %> and net <%= @low_round_net.net_from_par %> at <%= @low_round_net.golf_course.name %> by <%= @low_round_net.golfer.name %></h4>
