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
    Interface.welcome("Slots")
    play
  end

  def play
    Interface.line('Insert $1 to Play')
    puts '  1) Spin'
    puts '  2) Leave'
    Interface.input_prompt("Make A Selection")
    case gets.strip.to_i
    when 1
      @player.wallet.amount -= 1
      @player.check_wallet
    when 2
      @player.casino.menu
    else
      Interface.invalid("Invalid Input: Select a Number")
      play
    end
    @results.clear
    spin
    win_or_lose
    play
  end

  def spin
    3.times { @results.push(@reel.sample) }
    sleep(1)
    print "| #{@results.first} |"
    sleep(1)
    print " #{@results[1]} |"
    sleep(1)
    print " #{@results.last} |"
    sleep(1)
    puts ""
  end

  def win_or_lose
    if @results.all? { |symbol| symbol == @results.first }
      Interface.winner("You Won")
      @player.get_payout(@payout[@results.first.to_sym])
      sleep(1)
    else
      Interface.loser("You Lost")
      sleep(1)
    end
  end
end
