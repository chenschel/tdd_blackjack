# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_accessor :suits, :ranks, :deck

  def initialize(suits, ranks)
    @suits = suits
    @ranks = ranks
    create_deck
  end

  def replace_with(deck)
    @suits = []
    @ranks = []
    @deck = deck

    @deck.each do |card|
      add_suit_and_rank(card)
    end
    self
  end

  def shuffle
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end

  def amount
    @deck.size
  end

  private

  def create_deck
    @deck = @suits.product(@ranks).map { |(suit, rank)| Card.new(suit, rank) }
  end

  def add_suit_and_rank(card)
    @suits << card.suit unless @suits.include? card.suit
    @ranks << card.rank unless @ranks.include? card.rank
  end
end
