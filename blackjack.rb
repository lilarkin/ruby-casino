require 'pry'
require_relative 'player'
require_relative 'deck'

class Blackjack

  def initialize(player)
    @player = player
    @deck = Deck.new
    @deck.shuffle

    @dealer_cards = []
    @player_cards = []

    puts "*** Welcome, #{@player.name}, to Blackjack ***"
    play
  end


  def play
    make_bet
    deal_to_dealer
    display_dealer_hand
    deal_to_player
    binding.pry
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
  end

  def deal_to_dealer
    @dealer_cards << @deck.draw
  end

  def deal_to_player
    @player_cards << @deck.draw
  end

  def display_dealer_hand
    @dealer_cards.each { |card| puts card.name }
  end

  def display_player_hand

  end

  def bust?
  end

  def win_or_lose
    #compare dealer hand to player hand
  end

  def payout
  end

  def choose_to_play
  end

end


Blackjack.new(Player.new)
