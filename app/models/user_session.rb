class UserSession < ActiveRecord::Base
  belongs_to :user

  before_validation :set_unique_key

  scope :not_revoked, -> { where(revoked_at: nil) }
  scope :active, -> { not_revoked.where("accessed_at >= ?", 2.weeks.ago) }

  def self.authenticate(key)
    self.active.find_by(key: key)
  end

  def revoke!
    self.revoked_at = Time.now
    save!
  end

  def access(request)
    self.accessed_at = Time.now
    self.ip = request.ip
    self.user_agent = request.user_agent
    save
  end

  private
    def set_unique_key
      self.key = SecureRandom.urlsafe_base64(48)
    end
end