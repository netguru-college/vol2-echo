module RankingServices
  class RankingUpdater
    attr_accessor :player1_id, :player2_id, :match

    def initialize(match:)
      @match = match
      @player1_id = match.player_1
      @player2_id = match.player_2
    end

    def call
      update_ranking(@player1_id, @match)
      update_ranking(@player2_id, @match)
    end

    private

    def update_ranking(player_id, match)
      matches = Match.played_by_user_in_league(player_id, match.league_id)
      user_results = { league_id: match.league_id,
                       player_id: player_id,
                       played: matches.count,
                       won: 0,
                       drawn: 0,
                       lost: 0,
                       goals_for: 0,
                       goals_against: 0 }

      matches.each do |single_match|
        single_match_result = assign_values(player_id, single_match)
        user_results.merge!(single_match_result) { |_field, existing_val, new_val| existing_val + new_val }
      end

      update_db(user_results)
    end

    def assign_values(player_id, match)
      result = {
        goals_for: assign_goals(player_id, match).first,
        goals_against: assign_goals(player_id, match).last
      }
      result[:won] = 1 if result[:goals_for] > result[:goals_against]
      result[:drawn] = 1 if result[:goals_for] == result[:goals_against]
      result[:lost] = 1 if result[:goals_for] < result[:goals_against]

      result
    end

    def assign_goals(player_id, match)
      return [match.player1_goals, match.player2_goals] if match.player_1 == player_id
      [match.player2_goals, match.player1_goals]
    end

    def update_db(user_results)
      ranking_in_db = Ranking.find_by(league_id: user_results[:league_id], user_id: user_results[:player_id])
      ranking_in_db.assign_attributes(played: user_results[:played],
                                      won: user_results[:won],
                                      drawn: user_results[:drawn],
                                      lost: user_results[:lost],
                                      goals_for: user_results[:goals_for],
                                      goals_against: user_results[:goals_against],
                                      goal_diff: user_results[:goals_for] - user_results[:goals_against],
                                      points: user_results[:won] * 3 + user_results[:drawn])
      ranking_in_db.save
    end
  end
end

# For testing purposes:
# ranking = Ranking.find_by(league_id: 11, user_id: 30);
# match=Match.last; match.player1_goals=666; match.player2_goals=999; match.save;
# ranking = Ranking.find_by(league_id: 11, user_id: 30)
# ranking = Ranking.find_by(league_id: 11, user_id: 31)
