require 'pry'
require 'colorize'
require 'artii'


class Slots
  attr_accessor :player, :reel, :payout, :results, :bet

  def initialize(player)
    @player = player
    @reel = ['cherry', 'watermelon', 'bell', 'BAR', '7']
    # payout value is multiplier
    @payout = { 'cherry': 1, 'watermelon': 2, 'bell': 3, 'BAR': 4, '7': 5}
    @results = []
    @player.bet = 1
    Interface.welcome("*** Welcome, #{@player.name}, to the Slot Machines ***")
    play
  end

  def play
    Interface.line('Please insert $1 to play.')
    puts '  1) spin'
    puts '  2) quit'
    Interface.input_prompt("Enter You Answer")
    case gets.strip.to_i
    when 1
      @player.wallet.amount -= 1
      @player.check_wallet
    when 2
      @player.casino.menu
    else
      Interface.invalid("Invalid Input")
      play
    end
    @results.clear
    spin
    win_or_lose
    play
  end

  def spin
    3.times { @results.push(@reel.sample) }
    @results.each { |symbol| print "| #{symbol} " }
    print "|\n"
  end

  def win_or_lose
    if @results.all? { |symbol| symbol == @results.first }
      Interface.winner("You win.")
      @player.get_payout(@payout[@results.first.to_sym])
    else
      Interface.loser("You lose.")
    end
  end

  def play_again?
    Interface.line('Do you want to keep playing or quit?')
    puts '  1) play'
    puts '  2) quit'
    Interface.input_prompt("Enter You Answer")
    case gets.strip.to_i
    when 1
      play
    when 2
      Interface.welcome("Thanks for playing.")
      @player.casino.menu
    else
      Interface.invalid('Invalid Input')
    end
  end
end

# BONUS
# probability
# free spin
# play different slots (dif values)
