class Helpers
  
  def self.current_user(s)
    User.find_by(id: s[:user_id])
  end
  
  def self.is_logged_in?(s)
    !!User.find_by(id: s[:user_id])
  end
end