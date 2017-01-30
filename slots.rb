require 'pry'

class Slots
  attr_accessor :reel, :payout, :results, :bet

  def initialize
    # @reel in order of value
    @reel = ['cherry', 'watermelon', 'bell', 'BAR', '7']

    # payout value is multiplier
    @payout = { 'cherry': 1, 'watermelon': 2, 'bell': 3, 'BAR': 4, '7': 5}
    @results = []

    # cost for playing: 1$
    @bet = 1

    puts '*** Welcome to the Slot Machines ***'
    choose_to_play
  end

  def choose_to_play 
    puts 'Please insert $1 to play.'
    puts 'Enter 1 to spin or 2 to quit.'
    case gets.strip.to_i
    when 1
      play
    when 2 
      quit
    else 
      "Invalid Input"
      choose_to_play
    end
  end

  def play
    @results.clear
    spin
    win_or_lose
    choose_to_play
  end

  def quit
    puts 'Thanks for playing!'
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
  end
end


s = Slots.new

# takes money
# calculate if player won
# returns output and money/no money

# BONUS
# probability
# free spin
# play different slots (dif values)
