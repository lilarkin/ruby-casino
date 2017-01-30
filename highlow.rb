require 'pry'
require_relative 'player'
require_relative 'deck'
require_relative 'dice'

class HighLow
  attr_accessor :player, :bet

  def initialize(player)
    @player = player
    @bet = 0
    puts "*** Welcome, #{@player.name}, to High and Low ***"
    make_bet
  end

  def choose_to_play
    # user chooses to quit
  end

  def make_bet
    puts "How much do you want to bet?"
    bet = gets.chomp.to_i
    if bet == 0
      puts "Invalid Bet"
      make_bet
    end
    @bet = bet
    @player.place_bet(@bet)
    play
    binding.pry
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

HighLow.new(Player.new)
