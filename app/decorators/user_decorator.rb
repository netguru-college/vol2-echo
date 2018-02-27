class UserDecorator < Draper::Decorator
  delegate_all
  def leagues_summarize
    "Owns #{object.owned_leagues.count} leagues. Participes in #{object.leagues.count} leagues."
  end
end
