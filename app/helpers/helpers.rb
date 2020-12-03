class Helpers
  
  def self.current_user(hash)
    User.find_by(:id => hash[:user_id])

  end
  
  def self.is_logged_in?(hash)
    !!current_user(hash)
  end
end