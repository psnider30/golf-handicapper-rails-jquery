class GolfSummaryFieldsWorker
  include Sidekiq::Worker
  def perform
    Round.low_round_net
  end
end
