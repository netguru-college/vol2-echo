class Match < ApplicationRecord
  include ActiveModel::Dirty

  belongs_to :league
  belongs_to :player1, class_name: 'User', foreign_key: 'player_1'
  belongs_to :player2, class_name: 'User', foreign_key: 'player_2'
  validates_uniqueness_of :player_2, scope: %i[league_id player_1] # not tested yet

  scope :players, -> { includes(:player1, :player2) }
  scope :played_by_user, ->(user) { where('player_1 = ? OR player_2 = ?', user.id, user.id) }
  scope :played_by_user_in_league, ->(player_id, league_id) do
    where(
      'player_1 = ? OR player_2 = ? AND league_id = ? AND player1_goals IS NOT null AND player2_goals IS NOT null',
      player_id, player_id, league_id
    )
  end

  after_update :update_ranking

  def update_ranking
    RankingServices::RankingUpdater.new(match: Match.last).call
  end
end
