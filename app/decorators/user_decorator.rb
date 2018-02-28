class UserDecorator < Draper::Decorator
  delegate_all
  def leagues_summarize
    owns = object.owned_leagues.count
    participates = object.leagues.count
    "Owns #{owns} #{'league'.pluralize(owns)}. Participates in #{participates} #{'league'.pluralize(participates)}."
  end
end
