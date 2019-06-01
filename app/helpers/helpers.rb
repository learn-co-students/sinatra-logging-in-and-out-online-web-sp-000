class Helpers

  def self.current_user(s)
    User.find(s[:user_id])
  end

  def self.is_logged_in?(s)
    !!s[:user_id]
  end

end
