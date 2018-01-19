# frozen_string_literal: true

class Card
  SUITS = %w[Diamonds Spades Hearts Clubs].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  attr_accessor :show, :suit, :rank

  def initialize(suit, rank)
    @show = true

    if SUITS.include?(suit) && RANKS.include?(rank)
      @suit = suit
      @rank = rank
    else
      @suit = 'Unknown'
      @rank = 'Unknown'
    end
  end

  def to_s
    return '' unless @show
    "#{rank} of #{suit}"
  end
end
