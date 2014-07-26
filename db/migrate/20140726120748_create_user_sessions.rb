class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.integer :user_id, null: false
      t.string :key, null: false
      t.string :ip, null: false
      t.string :user_agent

      t.datetime :accessed_at, null: false
      t.datetime :revoked_at, default: nil
    end

    add_index :user_sessions, :key, :unique => true
    add_foreign_key :user_sessions, :users, dependent: :delete
  end
end
