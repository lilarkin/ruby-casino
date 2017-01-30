require 'pry'
require_relative 'deck'
require_relative 'dice'

class HighLow
  attr_accessor :player

  def initialize(player)
    @player = player

    puts "*** Welcome, #{@player.name}, to High and Low ***"
    dealer
  end

  def dealer
    # player places bet
  end

  def play
    # a card is drawn
    # player chooses high or low
    # card is drawn
    # cards are compared
    # players wins or lose
    win_or_lose
  end

  def win_or_lose
    #if win
      # payout
    # else
    # play again
  end

  def payout
    # pays double the bet
  end

  def quit
    puts 'Thanks for playing!'
  end
end
