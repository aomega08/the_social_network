class User < ActiveRecord::Base
  has_secure_password
  
  has_attached_file :profile_image, styles: {
    tiny: "50x50#",
    medium: "160x160#"
  }, default_url: lambda { |u| u.instance.default_profile_image }
  
  has_attached_file :cover_image, styles: {
    cover: "851x315#"
  }

  has_many :emails, class_name: 'UserEmail', dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :friendship_requests
  has_many :likes
  has_one :profile, foreign_key: 'id'

  validates_presence_of :name
  validates_presence_of :emails, message: 'User should have at least one email address.'
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/

  def self.find_by_email(email)
    UserEmail.find_by(email: email).try(:user)
  end

  def full_name
    name + ' ' + surname
  end

  def default_profile_image
    ActionController::Base.helpers.image_path("avatar.png")
  end

  def has_friend? user
    friends.where(id: user.id).count == 1
  end

  def has_friend_request? user
    friendship_requests.where(target_id: user.id).count == 1
  end

  def has_received_friend_request? user
    FriendshipRequest.where(user_id: user.id, target_id: self.id).count == 1
  end

  def profile
    tmp = super
    if tmp.nil?
      return self.profile = Profile.create(id: id, user: self) 
    end

    return tmp
  end
end
