class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user, :friend
  validates_uniqueness_of :friend, scope: :user

  def self.add_link(friend1, friend2)
    transaction do
      Friendship.create! user: friend1, friend: friend2
      Friendship.create! user: friend2, friend: friend1
    end
  end

  def self.delete_link(friend1, friend2)
    transaction do
      Friendship.where(user: friend1, friend: friend2).first.destroy
      Friendship.where(user: friend2, friend: friend1).first.destroy
    end
  end
end
