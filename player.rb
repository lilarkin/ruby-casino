require_relative 'wallet'

class Player
  attr_accessor :name, :wallet

  def initialize
    puts "What is your name?"
    @name = gets.strip
    puts "How much money are you playing with?"
    @wallet = Wallet.new(gets.strip.to_f)
  end

end
