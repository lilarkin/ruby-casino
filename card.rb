require_relative 'card_game_rules'

class Card
 attr_accessor :rank, :suit, :color
 def initialize(rank, suit, color)
   @rank = rank
   @suit = suit
   @color = color
 end

# TODO: show face cards name
 def name
   "#{rank} of #{suit}"
 end

 def value
   CardGameRules::RANKS.find_index(@rank)
 end

end
