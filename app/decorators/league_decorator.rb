class LeagueDecorator < Draper::Decorator
  delegate_all
  def fill_status
    if object.users.count == object.capacity
      "League is full. Max #{object.capacity} players."
    else
      "League is not full yet. #{object.users.count} players out of #{object.capacity}."
    end
  end
end
