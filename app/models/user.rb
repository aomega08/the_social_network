class User < ActiveRecord::Base
  has_secure_password

  has_many :emails, class_name: 'UserEmail', dependent: :destroy

  validates_presence_of :name

  def self.find_by_email(email)
    UserEmail.find_by(email: email).try(:user)
  end

  validate do
    if emails.count < 1
      errors.add(:emails, "is empty")
    end
  end
end
