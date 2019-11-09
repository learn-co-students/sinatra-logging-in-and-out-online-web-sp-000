class Helpers

  def self.current_user(session_hash)
    #should accept the session hash as an argument. This method should use the
    #user_id from the session hash to find the user in the database and return
    #that user.
    @user = User.find(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    #should also accept the session hash as an argument. This method should
    #return true if the user_id is in the session hash and false if not. The
    #Ruby !! operator will come in handy here.
    !!session_hash[:user_id]
  end

end
