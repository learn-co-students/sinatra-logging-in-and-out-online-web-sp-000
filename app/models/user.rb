class User < ActiveRecord::Base
  validates_presence_of :username, :password, :balance
  #attr_accessor :username, :password, :balance

  #def initialize(username: username, password: password, balance: balance)
      #@username = username
      #@password = password
      #@balance = balance
  #end

end