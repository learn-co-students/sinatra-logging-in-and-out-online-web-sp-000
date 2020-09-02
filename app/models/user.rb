class User < ActiveRecord::Base

    attr_accessor :username, :password, :balance

    @@all = []

    def initialize(username:, password:, balance:)
        @username = username
        @password = password
        @balance = balance
        # self.save
    end

    def self.all
        @@all
    end 

    def self.save
        @@all << self
    end

end 

