class Wallet
  attr_accessor :amount

  def initialize(amount)
    # you could randomly create an amount
    @amount = amount
    binding.pry
  end
end
