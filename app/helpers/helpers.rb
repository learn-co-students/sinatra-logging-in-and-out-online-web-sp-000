class Helpers
  
  def current_user(session)
    @user = User.find_by_id(session[:id])
  end
  
  def is_logged_in(session)
    !!session[:id]
  end
end