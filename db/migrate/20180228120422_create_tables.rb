class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.integer :league
      t.integer :player
      t.integer :played
      t.integer :won
      t.integer :drawn
      t.integer :lost
      t.integer :goals_for
      t.integer :goals_against
      t.integer :goal_diff
      t.integer :points
    end
  end
end
