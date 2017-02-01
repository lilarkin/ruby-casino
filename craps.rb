require 'pry'
require 'colorize'
require 'artii'
require_relative 'dice'
require_relative 'player'

class Craps

  def initialize(player)
    @player = player
    @dice = Dice.new

    Interface.welcome("*** Welcome, #{@player.name}, to Craps ***")
    play
  end

  def play
    @player.place_bet
    choose_pass_line
    come_out_roll
    play_again?
  end

  def choose_pass_line
    @pass_line = true
    Interface.line('Do you want to bet Pass or Don\'t Pass Line?')
    puts '  1) Pass Line'
    puts '  2) Don\'t Pass Line'
    Interface.input_prompt("Enter Your Answer")
    case gets.strip.to_i
      when 1
        roll_dice
      when 2
        @pass_line = false
        roll_dice
    else
      Interface.invalid('Invalid Input')
      choose_pass_line
    end
  end

  def roll_dice
    sleep(0.5)
    @dice.roll(2)
    @dice.result
  end

  def sum
    value = 0
    @dice.result.each { |roll| value += roll }
    value
  end

  def come_out_roll
    Interface.line("Please roll the dice:")
    puts "You rolled: #{roll_dice.join(' and ')}\n\n"
    if @pass_line
      if sum =~ /7|11/
        win
      elsif sum =~ /2|3|12/
        lose
      else
        @point = sum
        puts "The point roll is: #{@point}\n\n"
        point_number_roll
      end
    else
      if sum =~ /2|3/
        win
      elsif sum == 12
        puts 'You tied. Please start roll over.'.colorize(:magenta)
        come_out_roll
      elsif sum =~ /7|11/
        lose
      else
        @point = sum
        puts "The point roll is: #{@point}\n\n"
        point_number_roll
      end
    end
  end

  def point_number_roll
    sleep(1)
    Interface.line("Please roll again:")
    puts "You rolled: #{roll_dice.join(' and ')}\n\n"
    point2 = sum
    puts "You rolled: #{point2}\n\n"
    if @pass_line
      if @point == @point2
        win
      elsif sum == 7
        lose
      else
        point_number_roll
      end
    else
      if sum == 7
        win
      elsif sum == point2
        lose
      else
        point_number_roll
      end
    end
  end

  def win
    Interface.winner('You win!')
    @player.get_payout(2)
  end

  def lose
    Interface.loser('You lose.')
    @player.check_wallet
  end

  def play_again?
    Interface.line('Do you want to keep playing or quit?')
    puts '  1) Play'
    puts '  2) Quit'
    Interface.input_prompt("Enter Your Answer")
    case gets.strip.to_i
    when 1
      play
    when 2
      Interface.welcome("Thanks for playing.")
      @player.casino.menu
    else
      Interface.invalid('Invalid Input')
      play_again?
    end
  end
end
