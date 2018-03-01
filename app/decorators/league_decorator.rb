class LeagueDecorator < Draper::Decorator
  delegate_all
  def fill_status
    if object.users.count == object.capacity
      "League is full. Max #{object.capacity} players."
    else
      "League is not full yet. #{object.users.count} players out of #{object.capacity}."
    end
  end

  def average_rating
    if object.ratings.empty?
      "This league has not been rated yet."
    else
      rates = object.ratings.map { |rating| rating.rate }
      average_rating = rates.inject{ |sum, el| sum + el }.to_f / rates.size
      "Average rating: #{average_rating}"
    end
  end
end
