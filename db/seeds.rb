# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# Match.where( "matches.player_1 = ? OR matches.player_2 = ? ", user.id, user.id)
# Match.where(player_1: user).or(Match.where(player_2: user))
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w[Rysiek Dominika Kacper Bartosz Zuza Ozim Robert Kanapka Obiad Amator haslo_to_111111]
league_names = %w[Pusta_liga 1_gracz 2_graczy 3_graczy 4_graczy 5_graczy 6_graczy 7_graczy 8_graczy 9_graczy 10_graczy]
descriptions = %w[Fajna_liga Super_liga Liga_mistrzow Ekstraklasa Poznan_Rulez
                 Bialystok Warszawa Gdansk Krakow Katowice Liga_Amatorow]
pass = 111111

# Create Users:
names.each{ |name| User.create(email: "#{name}@pl",
                                      password: pass,
                                      password_confirmation: pass,
                                      name: name) }
users = User.all

# Create Leagues:
11.times do |i|
  #binding.pry
  League.create(name: league_names[i],
                description: descriptions[i],
                capacity: i,
                owner_id: i)
end

# Create LeaguesMembers and generate Matches:
leagues=League.all
leagues.each{ |league|
  league.capacity.times do |j|
    LeaguesMember.create(user_id: users[j].id, league_id: league.id)
  end
  #binding.pry
  LeagueServices::MatchesGenerator.new(league: league).call
}






#users = User.all
#leagues = League.all
# user =User.first
# leagues = League.create([
#                            {name: 'Warsaw league', description: 'Players from Warsaw office - join us!', capacity:2},
#                            {name: 'Poznan league', description: 'Players from Poznan office - join us!'},
#                            {name: 'Poland - best 16', description: 'Best 16 from all polish offices'},
#                            {name: 'Playground', description: 'Want to test your new tactics? Do it here!'}
#                        ])

# leagues_members = LeaguesMember.create([
#                                     {user_id: users[0].id, league_id: leagues[0].id},
#                                     {user_id: users[1].id, league_id: leagues[0].id},
#                                     {user_id: users[3].id, league_id: leagues[1].id},
#                                     {user_id: users[1].id, league_id: leagues[1].id},
#                                     {user_id: users[3].id, league_id: leagues[2].id},
#                                     {user_id: users[0].id, league_id: leagues[2].id},
#                                     {user_id: users[1].id, league_id: leagues[2].id},
#                                     {user_id: users[2].id, league_id: leagues[1].id},
#                                     {user_id: users[3].id, league_id: leagues[0].id},
#                                 ])
#
# matches = Match.create([
#                            {league_id: 1, player_1: 1, player_2: 2, player1_goals: 2, player2_goals: 2},
#                            {league_id: 2, player_1: 3, player_2: 4, player1_goals: 0, player2_goals: 3},
#                            {league_id: leagues[0].id, player_1: users[0].id, player_2: users[1].id, player1_goals: 2, player2_goals: 2},
#                            {league_id: leagues[0].id, player_1: users[1].id, player_2: users[0].id, player1_goals: 0, player2_goals: 3},
#
#                            {league_id: leagues[1].id, player_1: users[2].id, player_2: users[3].id, player1_goals: 21, player2_goals: 0},
#
#                            {league_id: leagues[2].id, player_1: users[1].id, player_2: users[3].id, player1_goals: 1, player2_goals: 1},
#
#                            {league_id: leagues[3].id, player_1: users[0].id, player_2: users[3].id, player1_goals: 2, player2_goals: 3},
#                            {league_id: leagues[3].id, player_1: users[0].id, player_2: users[3].id, player1_goals: 2, player2_goals: 4},
#                            {league_id: leagues[3].id, player_1: users[3].id, player_2: users[1].id, player1_goals: 5, player2_goals: 1},
#                            {league_id: leagues[3].id, player_1: users[3].id, player_2: users[2].id, player1_goals: 4, player2_goals: 6},
#                            {league_id: leagues[3].id, player_1: users[2].id, player_2: users[1].id, player1_goals: 0, player2_goals: 7},
#                            {league_id: leagues[3].id, player_1: users[2].id, player_2: users[3].id, player1_goals: 6, player2_goals: 4},
#                        ])