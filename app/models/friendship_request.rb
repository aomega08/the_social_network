class FriendshipRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, class_name: 'User'

  validates_presence_of :user, :target
  validates_uniqueness_of :target, scope: :user

  after_save :ensure_one_way

  def accept!
    transaction do
      delete
      Friendship.add_link user, target
    end
  end

  def ensure_one_way
    if FriendshipRequest.where(user: target, target: user).count != 0
      errors[:target] << "has already been taken"
      raise ActiveRecord::RecordInvalid.new self
    end
  end
end
