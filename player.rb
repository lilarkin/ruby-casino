require_relative 'wallet'

class Player
  attr_accessor :name, :wallet

  def initialize
    puts "What is your name?"
    @name = gets.strip
    @wallet = Wallet.new
    puts "You have this amount in your wallet: $#{@wallet.amount}"
  end
end
