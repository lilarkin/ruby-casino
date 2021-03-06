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
    Interface.money_statement("\nYou have $#{@wallet.amount} in your wallet.\n")
  end

  def get_payout(multiplier)
    payout = @bet * multiplier
    Interface.money_statement("You win $#{payout}.")
    @wallet.amount += payout
    check_wallet
  end

  def place_bet
    @casino.menu if @wallet.amount <= 0
    puts ""
    Interface.money_statement("How much do you want to bet?")
    Interface.input_prompt("Enter Your Answer")
    amount = gets.chomp.to_i
    if amount > @wallet.amount
      Interface.money_statement("You don't have that much money.")
      check_wallet
      place_bet
    elsif amount == 0
      Interface.invalid("Invalid Input: That's not an amount")
      place_bet
    end
    @bet = amount
    @wallet.amount -= @bet
  end

end
