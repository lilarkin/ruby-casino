require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'
require_relative 'slots'

class Casino
  # TODO: Handle Mutiple players
  # Hint: Think Array
  attr_accessor :player

  def initialize
    puts "Welcome to the Casino".colorize(:magenta)
    @player = Player.new
    puts "What game do you want to play, #{@player.name}?"
    menu
  end

  def menu
    puts '*** Casino Menu ***'
    puts '1. Slots'
    puts '2. High / Low'
    print 'Choose a Game: '

    case gets.strip.to_i
    when 1
      Slots.new
    when 2
      puts 'You play High / Low.'
      # HighLow.new
    else
      puts 'Invalid Input'
      menu
    end

  end
end

Casino.new
