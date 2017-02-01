require 'pry'
require 'colorize'
require 'artii'
require_relative 'interface'
require_relative 'player'
require_relative 'slots'
require_relative 'highlow'
require_relative 'blackjack'
require_relative 'craps'

class Casino
  attr_accessor :player

  def initialize
    puts ""
    a = Artii::Base.new
    puts a.asciify('Casino!').colorize(:green)
    Interface.welcome("Welcome to the Casino")
    @player = Player.new(self)
    menu
  end

  def menu
    check_player_money
    Interface.header('Casino Menu')
    puts '  1. Slots'
    puts '  2. High-Low'
    puts '  3. Blackjack'
    puts '  4. Craps'
    puts '  5. <- Leave Casino'
    Interface.input_prompt('Choose a Game')
    case gets.strip.to_i
    when 1
      Slots.new(@player)
    when 2
      HighLow.new(@player)
    when 3
      Blackjack.new(@player)
    when 4
      Craps.new(@player)
    when 5
      Interface.welcome('Thank for playing!')
      exit(0)
    else
      Interface.invalid('Invalid Input: Select A Number')
      menu
    end
  end

  def check_player_money
    if @player.wallet.amount <= 0
      puts "Uh oh. You are out of money.".colorize(:red)
      puts "You get kicked out of the casino".colorize(:red)
      sleep(1)
      exit(0)
    end
  end
end

Casino.new
