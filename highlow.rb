require_relative 'deck'
require_relative 'Player'

class HighLow

  def initialize(player)
    @player = player
    @deck = Deck.new

    puts "*** Welcome, #{@player.name}, to High and Low ***"
    play
  end

  def play
    make_bet
    deal_cards
    win_or_lose
    choose_to_play
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
     payout
   elsif @choice == 2 && @first_card.value > @second_card.value
     puts "You win!"
     payout
   else
     puts "You lose."
   end
  end

  def payout
  #TODO: make payout display wallet with losses in all games 
    payout = @bet * 2
    puts "You win $#{payout}."
    @player.get_payout(payout)
    puts "Now you have $#{@player.wallet.amount} money."
  end

  def choose_to_play
    # TODO: do we want to make this a module?
    puts 'Do you want to keep playing or quit?'
    puts '  1) play'
    puts '  2) quit'
    case gets.strip.to_i
    when 1
      play
    when 2
      quit
    else
      'Invalid Input'
    end
  end

  def quit
    puts 'Thanks for playing!'
  end
end

HighLow.new(Player.new)