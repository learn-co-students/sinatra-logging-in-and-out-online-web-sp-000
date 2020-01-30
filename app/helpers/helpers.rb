
#Instead of writing that type of logic directly into a view, we use helper methods. 
#Helper methods are methods that are written in the controller, are accessible in the views, and provide some logical support. 
#These two methods will only ever be called in views
class Helpers < ActiveRecord::Base
    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
    end

    def self.is_logged_in?(session)
        !!session[:user_id] # !! to be sure that the method is returning only true or false
    end

    # !! You use it if you only want the boolean, not the object. Any non-nil object except for boolean false represents true,
    # however, you'd return the data as well. By double negating it, you return a proper boolean.



end


