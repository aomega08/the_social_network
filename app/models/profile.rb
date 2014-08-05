class Profile < ActiveRecord::Base
  belongs_to :user, foreign_key: 'id'
  has_many :posts, as: :postable

  # The postable name
  def name
    user.full_name
  end
end