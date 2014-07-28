class FriendshipRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, class_name: 'User'

  validates_presence_of :user, :target
  validates_uniqueness_of :target, scope: :user

  def accept!
    transaction do
      delete
      Friendship.add_link user, target
    end
  end
end
