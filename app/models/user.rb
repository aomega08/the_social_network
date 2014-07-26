class User < ActiveRecord::Base
  has_secure_password

  has_many :emails, class_name: 'UserEmail', dependent: :destroy

  validates_presence_of :name
  validates_presence_of :emails, message: 'User should have at least one email address.'

  def self.find_by_email(email)
    UserEmail.find_by(email: email).try(:user)
  end
end
