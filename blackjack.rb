require 'pry'
require_relative 'player'
require_relative 'deck'

class Blackjack

  def initialize(player)
    @player = player
    @bet
    @deck = Deck.new
    @deck.shuffle
    @dealer_hand = []
    @player_hand = []
    @player_stay = false
    puts "*** Welcome, #{@player.name}, to Blackjack ***"
    new_game
  end

  def play
    deal_to_player unless @player_stay
    deal_to_dealer if calculate_hand(@dealer_hand) < 18
    won? if calculate_hand(@dealer_hand) > 18 &&  @player_stay
    hit? unless @player_stay
    play
  end

  def deal_to_dealer
    @dealer_hand << @deck.draw
    puts "The dealer has: "
    @dealer_hand.each { |card| puts "  #{card.name}" }
    if calculate_hand(@dealer_hand) > 21
      puts "The dealer busted."
      won
    end
  end

  def deal_to_player
    @player_hand << @deck.draw
    puts "You have: "
    @player_hand.each { |card| puts "  #{card.name}" }
    if calculate_hand(@player_hand) > 21
      puts "You busted."
      lose
    end
  end

  def hit?
    puts "Do you want to hit?"
    puts "  1) Yes"
    puts "  2) No"
    case gets.strip.to_i
    when 1
      play
    when 2
      @player_stay = true
      play
    else
      puts "Invalid Input"
      hit?
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
    ranks.reduce(&:+)
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
    puts "You won"
    puts "You get the payout"
    choose_to_play
  end

  def lose
    puts "You lose"
    choose_to_play
  end

  def choose_to_play
    # TODO: do we want to make this a module?
    puts 'Do you want to keep playing or quit?'
    puts '  1) play'
    puts '  2) quit'
    case gets.strip.to_i
    when 1
      new_game
    when 2
      quit
    else
      'Invalid Input'
    end
  end

  def quit
    puts 'Thanks for playing!'
  end

  def new_game
    @player.place_bet
    @dealer_hand.clear
    @player_hand.clear
    @player_stay = false
    play
  end

end
