class CreateUserEmails < ActiveRecord::Migration
  def change
    create_table :user_emails do |t|
      t.integer :user_id, null: false
      t.string :email, null: false
      t.boolean :verified, null: false, default: false

      t.timestamps
    end

    add_index :user_emails, :user_id
    add_index :user_emails, :email, :unique => true
    add_foreign_key :user_emails, :users, dependent: :delete
  end
end
