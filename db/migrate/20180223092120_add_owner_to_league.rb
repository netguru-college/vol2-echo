class AddOwnerToLeague < ActiveRecord::Migration[5.1]
  def change
    add_reference :leagues, :user
  end
end
