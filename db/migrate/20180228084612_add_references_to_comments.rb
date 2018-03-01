class AddReferencesToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :profile_id, :integer
    add_index :comments, :profile_id
    add_column :comments, :author_id, :integer
    add_index :comments, :author_id
  end
end
