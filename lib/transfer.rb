class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if valid? && sender.balance > amount && status == "pending"
      sender.deposit(amount * -1)
      receiver.deposit(amount)
      self.status = "complete"
    else
      rejected
      # self.status = "rejected"
      # return "Transaction rejected. Please check your account balance."
    end
  end

  def rejected
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && status == "complete"
    sender.deposit(amount)
    receiver.deposit(amount * -1)
    self.status = "reversed"
    end
  end


end


