class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :league
  validates_uniqueness_of :league_id, scope: :user_id
end
