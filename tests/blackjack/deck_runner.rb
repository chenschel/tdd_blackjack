# frozen_string_literal: true

require_relative 'deck'

SUITS = %w[Diamonds Spades Hearts Clubs].freeze
RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

deck = Deck.new(SUITS, RANKS)

puts deck.shuffle
puts

puts 'Dealt card details'
card = deck.deal_card
puts card.suit
puts card.rank
puts card
