class Helpers

  def self.current_user(session)
    user = User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    user = User.find(session[:user_id])
    if !!user
      true
    else
      false
    end
  end

end


# {"session_id"=>"ad01ee2b02e7f377b1a69763e8f1c2caaa9896727972a8cb3fb99ce0d8508201", "csrf"=>"KFm6gsniOQHtScZdyQv1pln10wleHf3NJSDyK00B7LQ=", "tracking"=>{"HTTP_USER_AGENT"=>"da39a3ee5e6b4b0d3255bfe
# f95601890afd80709", "HTTP_ACCEPT_LANGUAGE"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709"}, "id"=>1}

#<User:0x000000047f2098
 # id: 1,
 # username: "skittles123",
 # password: "iluvskittles",
 # balance: 1000.0>

# {:user_id=>1}
