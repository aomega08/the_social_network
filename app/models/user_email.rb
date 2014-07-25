class UserEmail < ActiveRecord::Base
  validates_presence_of :user_id, :email, :verified
  validates_uniqueness_of :email

  belongs_to :user
end
