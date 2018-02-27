module LeagueServices
  class MatchesGenerator
    attr_accessor :league, :users

    def initialize(league:)
      @league = league
      @users = league.users
    end

    def call
      pairs = calculate_pairs
      generate_matches(pairs)
    end

    private

    def calculate_pairs
      player_ids = users.map(&:id)
      player_ids.combination(2).to_a
    end

    def generate_matches(pairs)
      pairs.each do |pair|
        Match.create(
          league_id: league.id,
          player_1: pair.first,
          player_2: pair.last
        )
      end
    end
  end
end
