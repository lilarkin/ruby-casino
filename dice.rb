class Dice
  attr_accessor :result

  def initialize

    @result = []
    roll
  end

  def roll(num_of_dice = 1)
     @result.clear
    if num_of_dice == 1
      @result << 1 + rand(6)
      @result
    else
      num_of_dice.times { @result << 1 + rand(6)}
      @result
    end
  end
end

#  def show_dice
#    print "Die1: ", @die1, " Die2:", @die2
#  end

#  def show_sum
#    print "Sum of dice is ", @die1 + @die2, ".\n"
#    end

# d = Dice.new
# puts d.roll(2)
# puts d.result

