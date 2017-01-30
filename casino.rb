require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'

class Casino
  # TODO: Handle Mutiple players
  # Hint: Think Array
  attr_accessor :player

  def initialize
    puts "Welcome to the Casino".colorize(:magenta)
    @player = Player.new
    puts "What game do you want to play, #{@player.name}?"
    # show a casino game menu
    # let the player choose a game
    # initialize the new game passing teh player as a parameter
  end

  def menu
    putd '*** Casino Menu ***'
  end
end

Casino.new
