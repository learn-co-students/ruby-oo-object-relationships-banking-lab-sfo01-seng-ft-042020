class Transfer
  # your code here
  attr_reader :sender, :receiver 
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true 
    else
      return false
    end 
  end 

  def execute_transaction 
    if @sender.balance > @amount && self.valid? == true
      if status == "pending"
        @status = "complete"
        @sender.balance -= @amount
        @receiver.balance += @amount
      end 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  def reverse_transfer
    if status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status ="reversed"
    end 
  end
end
