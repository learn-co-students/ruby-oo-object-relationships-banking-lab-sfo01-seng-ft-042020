require 'pry'
class BankAccount
    attr_reader :name 
    attr_accessor :balance, :status 
    @@all = []

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
        save 
    end 

    def deposit(add_money)
        @balance += add_money 
    end 

    def display_balance 
        "Your balance is $#{balance}."
    end 

    def valid? 
        if @balance > 0 && @status == "open"
            true
        else 
            false
        end 
    end 

    def close_account
        @status = "closed"
    end 

    def save
        @@all << self
    end 

    def self.all
        @@all 
        #binding.pry 
    end 
    self.all 
end