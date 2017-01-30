class Wallet
  attr_accessor :amount

  def initialize
    @amount = rand(50...300) 
  end
end
