class UserEmail < ActiveRecord::Base
  validates_presence_of :email, :user
  validates_inclusion_of :verified, in: [true, false]
  validates_uniqueness_of :email

  belongs_to :user
end
