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
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    
    puts @sender.valid?
    puts @receiver.valid?

    if(@sender.balance <= @amount || valid? == false)
      
      @status = 'rejected'
      
      
      return "Transaction rejected. Please check your account balance."
    
    elsif(@status == 'pending')
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = 'complete'
    end 
  end
  
  def reverse_transfer
    if(@status == 'complete')
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = 'reversed'
    end
  end
end
