class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :message
      t.references :user, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true
      t.timestamps
    end
  end
end
