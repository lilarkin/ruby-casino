require_relative 'interface'
require_relative 'wallet'

class Player
  attr_accessor :name, :wallet, :bet, :casino

  def initialize(casino)
    @casino = casino
    Interface.input_prompt("Enter Your Name")
    @name = gets.strip
    @bet = 0
    @wallet = Wallet.new
    check_wallet
  end

  def check_wallet
    puts "You have $#{@wallet.amount} in your wallet."
  end

  def get_payout(multiplier)
    payout = @bet * multiplier
    puts "You win $#{payout}."
    @wallet.amount += payout
    check_wallet
  end

  def place_bet
    @casino.menu if @wallet.amount <= 0
    puts "How much do you want to bet?"
    amount = gets.chomp.to_i
    if amount > @wallet.amount
      puts "You don't have that much money."
      check_wallet
      place_bet
    end
    @bet = amount
    @wallet.amount -= @bet
  end

end
