require_relative 'card'

class Deck
 attr_accessor :cards

 def initialize
   @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
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
    hand = []
    num_of_cards.times { hand << @cards.pop }
    hand
  end
end
