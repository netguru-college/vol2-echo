class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :league_id, null: false
      t.integer :user_id, null: false
      t.integer :played, default: 0
      t.integer :won, default: 0
      t.integer :drawn, default: 0
      t.integer :lost, default: 0
      t.integer :goals_for, default: 0
      t.integer :goals_against, default: 0
      t.integer :goal_diff, default: 0
      t.integer :points, default: 0
    end
  end
end
