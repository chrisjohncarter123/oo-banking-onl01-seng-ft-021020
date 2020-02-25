class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if(@sender.balance < @amount)
      "Transaction rejected. Please check your account balance."
    end
    
    if(@status == 'pending')
      sender.deposit(amount * -1)
      receiver.deposit(amount)
      @status = 'complete'
    end 
  end
  
  def reverse_transfer
    
  end
end
