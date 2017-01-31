require_relative 'wallet'

class Player
  attr_accessor :name, :wallet, :bet, :casino

  def initialize(casino)
    @casino = casino
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

  def play_again?
    # TODO: do we want to make this a module?
    puts 'Do you want to keep playing or quit?'
    puts '  1) play'
    puts '  2) quit'
    case gets.strip.to_i
    when 1
      play
    when 2
      puts "Thanks for playing."
      @casino.menu
    else
      'Invalid Input'
    end
  end
end
