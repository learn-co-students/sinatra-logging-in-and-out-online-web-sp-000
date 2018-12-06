class Helpers
  def self.current_user(sess_hash)
    @user = User.find_by_id(sess_hash[:user_id])
  end
  
  def self.is_logged_in?(sess_hash)
    !!sess_hash[:user_id]
  end
end