class WelcomeController < ApplicationController

  def home
    @golfers_count = Golfer.golfers_count
    @lowest_course_slope = GolfCourse.lowest_course_slope
    @highest_course_slope = GolfCourse.highest_course_slope
    @low_round_from_par = Round.low_round_from_par
    @low_round_net = Round.low_round_net
    @lowest_index = Golfer.lowest_index
  end
end

#<h4>Net Low Round: Score of <%= @low_round_net.score %> and net <%= @low_round_net.net_from_par %> at <%= @low_round_net.golf_course.name %> by <%= @low_round_net.golfer.name %></h4>
