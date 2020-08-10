
- in app:
#why don't i have to create an instance of the user using params anywhere

in helper.rb:
# how does this class know what User is? or that that class exist
# self.current_user is supposed to return that user, does it do that implicitly? why don't have to put return @user?
# is .find_by_id an ActiveRecord method?

in user.rb:
# how come don't need to have attr_accessor for name, password, etc or initialize?


in account.rb:
# how does this file know what Helpers class is? why not need to require file at top?

in index.rb
# how does it know which post route to use?


How do I see User.all and params using puts etc. 
