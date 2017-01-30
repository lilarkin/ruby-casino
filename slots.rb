class Slots
  # attr_accessor

  def initialize
    @reel = ['cherry', 'watermelon', '7', 'BAR', 'bell']
    @results = []
  end

  def spin
     3.times { @results.push(@reel.sample) }
    end
     puts @results
  end

  def payout
    
  end
end

# s = Slots.new
# s.spin

# takes money
# calculate if player won
# returns output and money/no money 

# BONUS
# probability 
# free spin
