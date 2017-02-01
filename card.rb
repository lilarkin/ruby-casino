require_relative 'card_game_rules'

class Card
  attr_accessor :rank, :suit, :color

  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
    @suit_symbols = { Clubs: "\u2663", Diamonds: "\u2666", Hearts: "\u2665", Spades: "\u2660"}
  end

# TODO: show face cards name
  def name
    "#{@rank}#{@suit_symbols[@suit.to_sym]}"
  end

  def value
    CardGameRules::RANKS.find_index(@rank)
  end

end
