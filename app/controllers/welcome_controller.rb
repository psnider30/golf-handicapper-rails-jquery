class WelcomeController < ApplicationController

  def home
    # @golfers_count = Golfer.golfers_count
    # @lowest_course_slope = GolfCourse.lowest_course_slope
    # @highest_course_slope = GolfCourse.highest_course_slope
    # @low_round_from_par = Round.low_round_from_par
    # @low_round_net = Round.low_round_net
    # @lowest_index = Golfer.lowest_index
  end
end

# <% if logged_in? %>
#   <h4>Golfers in your Group: <%= @golfers_count %></h4>
#   <h4>Low Handicap Index: <%= @lowest_index.golfer_index %> for <%= @lowest_index.name %></h4>
#   <h4>Low Round: <%= @low_round_from_par.display_from_par %> with score of <%= @low_round_from_par.score %> at <%= @low_round_from_par.golf_course.name %> by <%= @low_round_from_par.golfer.name %></h4>
#   <h4>Net Low Round: Score of <%= @low_round_net.score %> and net <%= @low_round_net.net_from_par %> at <%= @low_round_net.golf_course.name %> by <%= @low_round_net.golfer.name %></h4>
#   <h4>Easiest Course: <%= @lowest_course_slope.name %> with course slope of <%= @lowest_course_slope.course_slope %></h4>
#   <h4>Most Difficult Course: <%= @highest_course_slope.name %> with course slope of <%= @highest_course_slope.course_slope %></h4>
# <% end %>
