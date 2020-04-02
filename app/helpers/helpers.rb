class Helpers

  def self.is_logged_in?(sess_hash)
    !!sess_hash[:user_id]
  end

  def self.current_user(sess_hash)
    User.find(sess_hash[:user_id])
  end
end
