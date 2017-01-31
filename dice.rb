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



