class MatchesGenerator
  def initialize(league:)
    @league = league
    @users = league.users
    @league_id = league.id
  end

  def call
    players_id = extract_player_id_from_users
    pairs = create_pairs_of_users(players_id)
    populate_db_with_matches(pairs)
  end

  private
  def extract_player_id_from_users
    @users.map{|player| player.id}
  end

  def create_pairs_of_users(players)
    #binding.pry
    players.combination(2).to_a
  end

  def populate_db_with_matches(pairs)
    pairs.each do |pair|
      Match.create(league_id: @league_id, player_1: pair.first, player_2: pair.last)
    end
  end

end