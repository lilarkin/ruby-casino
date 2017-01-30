require 'pry'

class Slots
  attr_accessor :player, :reel, :payout, :results, :bet

  def initialize(player)
    @player = player
    @reel = ['cherry', 'watermelon', 'bell', 'BAR', '7']
    # payout value is multiplier
    @payout = { 'cherry': 1, 'watermelon': 2, 'bell': 3, 'BAR': 4, '7': 5}
    @results = []

    # TODO: rename
    @bet = 1

    puts "*** Welcome, #{@player.name}, to the Slot Machines ***"
    choose_to_play
  end

  def choose_to_play
    puts 'Please insert $1 to play.'
    puts '  1) spin'
    puts '  2) quit'
    case gets.strip.to_i
    when 1
      puts "You have $#{@player.wallet.amount} money."
      @player.place_bet(1)
      play
    when 2
      quit
    else
      puts "Invalid Input"
      choose_to_play
    end
  end

  def play
    @results.clear
    spin
    win_or_lose
    choose_to_play
  end

  def spin
     3.times { @results.push(@reel.sample) }
    @results.each { |symbol| print "| #{symbol} " }
    print "|\n"
  end

  def win_or_lose
    if @results.all? { |symbol| symbol == @results.first }
      puts "You win."
      payout
    else
      puts "You lose."
    end
  end

  def payout
    payout = @bet * @payout[@results.first.to_sym]
    puts "You win $#{payout}."
    @player.get_payout(payout)
    puts "Now you have $#{@player.wallet.amount} money."

  end

  def quit
    puts 'Thanks for playing!'
  end
end

# BONUS
# probability
# free spin
# play different slots (dif values)
