require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def complete
    if @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end

  def rejected
    if !valid? || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def execute_transaction
    rejected || complete
  end

  def reverse_transfer
    if @sender.balance != @receiver.balance
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
