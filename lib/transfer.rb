class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt  
    @status = "pending"
  end
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end
  def execute_transaction
    if self.status == "pending" 
      if !self.valid?
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end

      if self.sender.balance > self.amount
      
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end

  end
end
