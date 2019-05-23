class Helpers
  def current_user(hash)
    User.find_by(id: hash[:user_id]) if hash[:user_id]
    
  end 

  def is_logged_in?(hash)
   !!hash[:user_id]
  end 
end