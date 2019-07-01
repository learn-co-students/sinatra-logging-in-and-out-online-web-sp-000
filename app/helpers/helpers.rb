class Helpers
  def self.current_user(hash)
    user = User.find(hash[:user_id])
    user
  end

  def self.is_logged_in?(hash)
    !!(hash[:user_id])
  end
end
