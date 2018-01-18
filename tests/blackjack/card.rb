# frozen_string_literal: true

class Card
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
