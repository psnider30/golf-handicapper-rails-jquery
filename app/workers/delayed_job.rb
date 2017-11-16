class DelayedJob

  def get_low_net
     Round.low_round_net
  end
  handle_asynchronously :get_low_net
end
