class CreateFriendshipRequests < ActiveRecord::Migration
  def change
    create_table :friendship_requests do |t|
      t.integer :user_id, null: false
      t.integer :target_id, null: false

      t.timestamps
    end

    add_index :friendship_requests, :user_id
    add_index :friendship_requests, :target_id
    add_index :friendship_requests, [:user_id, :target_id], unique: true
    add_foreign_key :friendships, :users, dependent: :delete
    add_foreign_key :friendships, :users, column: 'target_id', dependent: :delete
  end
end
