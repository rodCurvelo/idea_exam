class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :alias
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
