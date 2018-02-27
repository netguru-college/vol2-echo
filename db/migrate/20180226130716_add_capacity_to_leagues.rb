class AddCapacityToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :capacity, :integer, null:false, default: 4
  end
end
