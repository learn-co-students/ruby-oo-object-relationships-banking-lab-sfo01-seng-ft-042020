require 'pry'

class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end 

    def deposit(amount)
        @balance += amount
    end
    
    def display_balance
        p "Your balance is $#{self.balance}."
    end

    def valid?
    #   binding.pry
      self.status == "open" && self.balance > 0 ? true : false
    end 

    def close_account
        # binding.pry
        self.status = "closed"
    end

end
