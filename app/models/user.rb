class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :profile_image, styles: {
    tiny: "50x50#",
    medium: "300x300>",
    thumb: "100x100>"
  }, default_url: lambda { |u| u.instance.default_profile_image }

  has_many :emails, class_name: 'UserEmail', dependent: :destroy

  validates_presence_of :name
  validates_presence_of :emails, message: 'User should have at least one email address.'
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/

  def self.find_by_email(email)
    UserEmail.find_by(email: email).try(:user)
  end

  def default_profile_image
    ActionController::Base.helpers.image_path("avatar.png")
  end
end
