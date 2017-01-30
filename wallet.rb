class Wallet
  attr_accessor :amount

  def initialize
    @amount = rand(10...100) 
  end
end


