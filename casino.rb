require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'
require_relative 'slots'
require_relative 'highlow'
require_relative 'blackjack'
require_relative 'craps'

class Casino
  # TODO: Handle Mutiple player. Hint: Think Array
  attr_accessor :player

  def initialize
    puts "Welcome to the Casino".colorize(:magenta)
    @player = Player.new(self)
    puts "What game do you want to play, #{@player.name}?"
    menu
  end

  def menu
    check_player_money
    puts '*** Casino Menu ***'
    puts '1. Slots'
    puts '2. High / Low'
    puts '3. Blackjack'
    puts '4. Craps'
    puts '5. Leave Casino'
    print 'Choose a Game: '
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
      puts 'Thank for playing!'
      exit(0)
    else
      puts 'Invalid Input'
      menu
    end
  end

  def check_player_money
    if @player.wallet.amount <= 0
      puts "Uh oh. You are out of money"
      puts "You get kicked out of the casino"
      exit(0)
    end
  end
end

Casino.new
