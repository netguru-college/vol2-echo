class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :message
      t.timestamps
    end
  end
end
