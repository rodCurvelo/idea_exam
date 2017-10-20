class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :idea
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
