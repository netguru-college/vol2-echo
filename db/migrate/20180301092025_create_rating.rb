class CreateRating < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :rate
    end
  end
end
