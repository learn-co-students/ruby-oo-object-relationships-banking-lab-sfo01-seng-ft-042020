require 'pry'

class Transfer
  # your code here

    attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount

  end

  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    case
    when !self.valid? || sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    when @status == "pending"
      sender.balance -= amount 
      receiver.balance += amount
      @status = "complete"
    end
  end
    
    def reverse_transfer
      if @status == "complete"
        @sender.balance += amount
        @receiver.balance -= amount
        @status = "reversed"
      # binding.pry
    end

  end




end
