class CreateLeaguesMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues_members do |t|
      t.integer :user_id
      t.integer :league_id
      t.timestamps
    end
  end
end
