require 'pry'
require_relative 'player'
require_relative 'deck'
require_relative 'dice'

class HighLow
  attr_accessor :player, :bet, :deck

  def initialize(player)
    @player = player
    @bet = 0
    @deck = Deck.new

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
    deal_cards
  end

  def deal_cards
    @deck.shuffle
    @first_card = @deck.draw
    puts "The first card is: #{@first_card.name}"
    puts 'The next card will be:'
    puts '  1) higher'
    puts '  2) lower'
    @choice = gets.chomp.to_i
    # TODO: make sure they only choose 1 or 2 or else error
    @second_card = @deck.draw
    puts "The second card is #{@second_card.name}"
    win_or_lose
  end

 def win_or_lose
   # TODO: if cards equal win condition
   if @choice == 1 && @first_card.value < @second_card.value
     puts "WIN"
   elsif @choice == 2 && @first_card.value > @second_card.value
     puts "WIN"
   else
     puts "LOSE"
   end
    #if win
      # payout
    # else
    # play again
  end

  def play
    # a card is drawn
    # player chooses high or low
    # card is drawn
    # cards are compared
    # players wins or lose
    win_or_lose
  end

  def payout
    # pays double the bet
  end

  def quit
    puts 'Thanks for playing!'
  end
end

HighLow.new(Player.new)
