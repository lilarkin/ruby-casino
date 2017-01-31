require 'pry'
require_relative 'card'
require_relative 'card_game_rules'

class Deck
 attr_accessor :cards

 def initialize
   @ranks = CardGameRules::RANKS
   @suits = %w(Spades Diamonds Clubs Hearts)
   @cards = []
   generate_deck
 end

 def generate_deck
   @suits.each do |suit|
     @ranks.each do |rank|
       if suit == 'Spades' || suit == 'Clubs'
         color = 'Black'
       else
         color = 'Red'
       end
       @cards << Card.new(rank, suit, color)
     end
   end
 end

 def shuffle
   @cards.shuffle!
 end

  def draw(num_of_cards = 1)
    # TODO: what if deck is empty?
    if num_of_cards > 1
      hand = []
      num_of_cards.times { hand << @cards.pop }
      return hand
    else
      return @cards.pop
    end
  end
end

Deck.new
