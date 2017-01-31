require_relative 'wallet'

class Player
  attr_accessor :name, :wallet, :bet

  def initialize
    puts "What is your name?"
    @name = gets.strip
    @bet = 0
    @wallet = Wallet.new
    puts "You have this amount in your wallet: $#{@wallet.amount}"
  end

  def get_payout(multiplier)
    payout = @bet * multiplier
    puts "You win $#{payout}."
    @wallet.amount += payout
    puts "Now you have $#{@wallet.amount} money."
  end

  def place_bet
    puts "How much do you want to bet?"
    amount = gets.chomp.to_i
    if amount == 0 || amount > @wallet.amount
      puts "Invalid Bet"
      place_bet
    end
    @bet = amount
    @wallet.amount -= @bet
  end

end
