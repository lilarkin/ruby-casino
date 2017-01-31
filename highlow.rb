require_relative 'deck'

class HighLow

  def initialize(player)
    @player = player
    @deck = Deck.new

    puts "*** Welcome, #{@player.name}, to High and Low ***"
    play
  end

  def play
    @player.place_bet
    deal_cards
    win_or_lose
    @player.play_again?
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
  end

 def win_or_lose
   # TODO: if cards equal win condition
   if @choice == 1 && @first_card.value < @second_card.value
     puts "You win!"
     @player.get_payout(2)
   elsif @choice == 2 && @first_card.value > @second_card.value
     puts "You win!"
     @player.get_payout(2)
   else
     puts "You lose."
   end
  end
end
