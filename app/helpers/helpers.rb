require 'sinatra/base'

class Helpers

    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
    end
    # uses session[:user_id] to find the user in the database

    def is_logged_in?
        !!session[:user_id]
    end
    #return true if user_id is in session hash
    #return false if not
end

# how does this class know what User is? or that that class exist
# self.current_user is supposed to return that user, does it do that implicitly? why don't have to put return @user?
# is .find_by_id an ActiveRecord method?
