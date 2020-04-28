require 'pry'
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(person_name)
        @name = person_name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit)
      @balance += deposit
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
      if self.status == "open" && self.balance > 0
        return true
      else
        return false
      end
    end

    def close_account
      self.status = "closed"
    end

end
