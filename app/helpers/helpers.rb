class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end
  #current_user should accept the session hash as an argument.
  #This method should use the user_id from the session hash to
  # find the user in the database and return that user.

  def self.is_logged_in?(session)
    !!session[:user_id]
  end
  #return TRUE if user_id is in the session hash

end
