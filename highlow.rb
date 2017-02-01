require 'pry'
require 'colorize'
require 'artii'
require_relative 'deck'

class HighLow

  def initialize(player)
    @player = player
    @deck = Deck.new

    Interface.welcome("*** Welcome, #{@player.name}, to High and Low ***")
    play
  end

  def play
    @player.place_bet
    deal_cards
    win_or_lose
    play_again?
  end

  def deal_cards
    @deck.shuffle
    @first_card = @deck.draw
    ask_higher_or_lower
    @second_card = @deck.draw
    puts "The second card is: #{@second_card.name}"
  end

  def ask_higher_or_lower
    puts "The first card is: #{@first_card.name}"
    Interface.line'The next card will be:'
    puts '  1) higher'
    puts '  2) lower'
    Interface.input_prompt('Enter Your Answer')
    input = gets.chomp.to_i
    case input
    when 1,2
      @choice = input
    else
      Interface.invalid("Invalid Input")
      ask_higher_or_lower
    end
  end

  def win_or_lose
    if @choice == 1 && @first_card.value < @second_card.value
      win
    elsif @choice == 2 && @first_card.value > @second_card.value
      win
    else
      lose
    end
  end

  def win
    Interface.winner("You win!")
    @player.get_payout(2)
  end

  def lose
    Interface.loser("You lose.")
    @player.check_wallet
  end

  def play_again?
    Interface.header('Do you want to keep playing or quit?')
    puts '  1) play'
    puts '  2) quit'
    Interface.input_prompt('Enter Your Answer')
    case gets.strip.to_i
    when 1
      play
    when 2
      Interface.welcome("Thanks for playing.")
      @player.casino.menu
    else
      Interface.invalid('Invalid Input')
      play_again?
    end
  end
end
