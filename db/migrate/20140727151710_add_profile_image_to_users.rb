class AddProfileImageToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :profile_image
    add_attachment :users, :cover_image
  end
end
