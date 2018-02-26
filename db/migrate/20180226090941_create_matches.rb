class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :league_id
      t.integer :player_1
      t.integer :player_2
      t.integer :player1_goals
      t.integer :player2_goals
    end
  end
end
