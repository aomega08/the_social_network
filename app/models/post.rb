class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :postable, polymorphic: true
  has_many :likes, as: :likeable

  validates_presence_of :content, :author, :postable

  default_scope -> {order(created_at: :desc)}
end
