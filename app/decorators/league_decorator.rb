# app/decorators/article_decorator.rb
class ArticleDecorator < Draper::Decorator
  def fill_status
    if object.users.count == object.capacity
      "League is full. Max #{object.capacity} players."
    else
      "League is not full yet. #{object.users.count} players out of #{object.capacity}."
  end
end
