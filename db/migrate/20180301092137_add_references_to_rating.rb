class AddReferencesToRating < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :league_id, :integer
    add_index :ratings, :league_id
    add_column :ratings, :user_id, :integer
    add_index :ratings, :user_id
  end
end
