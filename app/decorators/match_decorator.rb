class MatchDecorator < Draper::Decorator
  delegate_all
  def score
    if !object.player1_goals.nil? && !object.player2_goals.nil?
      "Score: #{player1_goals}:#{player2_goals}"
    else
      "Match haven't played"
    end
  end
end
