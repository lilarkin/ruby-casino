require 'pry'
require 'colorize'
require 'artii'
require_relative 'deck'

class Blackjack
  attr_accessor :player_hand
  def initialize(player)
    @player = player
    @deck = Deck.new
    @dealer_hand = []
    @player_hand = []
    Interface.welcome("Blackjack")
    new_game
  end

  def new_game
    @player.place_bet
    @deck.shuffle
    @dealer_hand.clear
    @player_hand.clear
    @player_stay = false
    play
  end

  def play
    sleep(1)
    deal_to_player unless @player_stay
    sleep(1)
    deal_to_dealer if calculate_hand(@dealer_hand) < 18
    sleep(1)
    won? if calculate_hand(@dealer_hand) > 18 &&  @player_stay
    hit? unless @player_stay
    play
  end

  def deal_to_player
    @player_hand << @deck.draw
    Interface.line("You have: ")
    @player_hand.each { |card| puts "  #{card.name}" }
    if calculate_hand(@player_hand) > 21
      puts "You busted."
      lose
    end
  end

  def deal_to_dealer
    @dealer_hand << @deck.draw
    Interface.line("The dealer has: ")
    @dealer_hand.each { |card| puts "  #{card.name}" }
    if calculate_hand(@dealer_hand) > 21
      puts "The dealer busted."
      won
    end
  end

  def calculate_hand(hand)
    return 0 if hand.empty?
    ranks = []
    hand.each { |card| ranks << card.rank }
    ranks.map! do |rank|
      if rank =~ /J|Q|K/
        10
      elsif rank == "A"
        11
      else
        rank.to_i
      end
    end
    total = ranks.reduce(&:+)
    while total > 21 && ranks.include?(11)
      ranks[ranks.index(11)] = 1
      total = ranks.reduce(&:+)
    end
    total
  end

  def hit?
    Interface.line("Do you want to hit?")
    puts "  1) Yes"
    puts "  2) No"
    Interface.input_prompt("Enter Your Answer")
    case gets.strip.to_i
    when 1
      play
    when 2
      @player_stay = true
      play
    else
      Interface.invalid("Invalid Input")
      hit?
    end
  end

  def won?
    player = calculate_hand(@player_hand)
    dealer = calculate_hand(@dealer_hand)
    puts "You got #{player}."
    puts "The dealer got #{dealer}."
    won if player > dealer
    lose
  end

  def won
    Interface.winner("You win!")
    @player.get_payout(2)
    play_again?
  end

  def lose
    Interface.loser("You lose.")
    @player.check_wallet
    play_again?
  end

  def play_again?
    Interface.line('Do you want to keep playing or quit?')
    puts '  1) Play'
    puts '  2) Leave'
    Interface.input_prompt("Enter Your Answer")
    case gets.strip.to_i
    when 1
      new_game
    when 2
      Interface.welcome("Thanks for playing.")
      @player.casino.menu
    else
      Interface.invalid('Invalid Input')
    end
  end
end
