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

  end

  #Interface: (play) method

  def spin
     3.times { @results.push(@reel.sample) }
     puts @results
     win_or_lose
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
    puts "You won #{payout}."
  end
end


s = Slots.new
s.results = ['7','7','7']
s.payout

# takes money
# calculate if player won
# returns output and money/no money

# BONUS
# probability
# free spin
