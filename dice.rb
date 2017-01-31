class Dice

 def initialize
   roll
 end

 def roll(num_of_dice = 1)
   if num_of_dice == 1
       return 1 + rand(6)
   else
    dice_roll = []
    num_of_dice.times { dice_roll << 1 + rand(6)}
    return dice_roll
   end
 end
end

#  def show_dice
#    print "Die1: ", @die1, " Die2:", @die2
#  end

#  def show_sum
#    print "Sum of dice is ", @die1 + @die2, ".\n"
#    end
