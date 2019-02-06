

class User < ActiveRecord::Base

  validates_presence_of :username, :password, :account

end
