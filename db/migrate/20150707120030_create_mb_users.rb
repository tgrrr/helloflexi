class CreateMbUsers < ActiveRecord::Migration
  def change
    create_table :mb_users do |t|
      t.integer :mb_id, null: false
      t.integer :user_id, null: false
      t.integer :studio_id, null: false
      t.timestamps null: false
    end
    add_foreign_key :mb_users, :users
    add_foreign_key :mb_users, :studios
    add_index :mb_users, [:user_id, :studio_id], :unique => true
  end
end

