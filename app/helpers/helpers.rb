class Helpers
  def self.current_user(sess_hash)
    @current = User.find(sess_hash[:user_id])
  end
  
  def self.is_logged_in?(sess_hash)
    @current.id == sess_hash[:user_id]
  end
end