require 'pry'
require 'colorize'
require 'artii'
require_relative 'dice'
require_relative 'player'

class Craps

  def initialize(player)
    @player = player
    @dice = Dice.new

    puts "*** Welcome, #{@player.name}, to Craps ***"
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
    puts 'Do you want to bet Pass or Don\'t Pass Line?'
    puts '  1) Pass Line'
    puts '  2) Don\'t Pass Line'
    case gets.strip.to_i
      when 1
        roll_dice
      when 2
        @pass_line = false
        roll_dice
    else
      puts 'Invalid Input'
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
    puts "Please roll the dice:"
    puts "You rolled: #{roll_dice.join(' and ')}\n\n"
    if @pass_line
      if sum == 7 || sum == 11
        puts 'You win!'
        @player.get_payout(2)
      elsif sum == 2 || sum == 3 || sum == 12
        puts 'You lose.'
      else
        @point = sum
        puts "The point roll is: #{@point}\n\n"
        point_number_roll
      end
    else
      if sum == 2 || sum == 3
        puts 'You win!'
        @player.get_payout(2)
      elsif sum == 12
        puts 'You tied. Please start roll over.'
        come_out_roll
      elsif sum == 7 || sum == 11
        puts "You lose."
      else
        @point = sum
        puts "The point roll is: #{@point}\n\n"
        point_number_roll
      end
    end
  end

  def point_number_roll
    sleep(1)
    puts "Please roll again:"
    puts "You rolled: #{roll_dice.join(' and ')}\n\n"
    point2 = sum
    puts "You rolled: #{point2}\n\n"
    if @pass_line
      binding.pry
      if @point == @point2
        puts 'You win!'
        @player.get_payout(2)
      elsif sum == 7
        puts 'You lose.'
      else
        point_number_roll
      end
    else
      if sum == 7
        puts 'You win!'
        @player.get_payout(2)
      elsif sum == point2
        puts 'You lose.'
      else
        point_number_roll
      end
    end
  end

  def play_again?
    puts 'Do you want to keep playing or quit?'
    puts '  1) play'
    puts '  2) quit'
    case gets.strip.to_i
    when 1
      play
    when 2
      puts "Thanks for playing."
      @player.casino.menu
    else
      'Invalid Input'
    end
  end
end
