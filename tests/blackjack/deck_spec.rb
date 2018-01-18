# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'

RSpec.describe Deck do
  SUITS = %w[Diamonds Spades Hearts Clubs].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

  before do
    @deck = Deck.new(SUITS, RANKS)
  end

  it 'respond to shuffle' do
    expect(@deck).to respond_to(:shuffle)
  end

  it 'respond to deal_card' do
    expect(@deck).to respond_to(:deal_card)
  end

  it 'respond to suits' do
    expect(@deck).to respond_to(:suits)
  end

  it 'respond to ranks' do
    expect(@deck).to respond_to(:ranks)
  end

  it 'respond to replace_with' do
    expect(@deck).to respond_to(:replace_with)
  end

  it 'respond to deck' do
    expect(@deck).to respond_to(:deck)
  end

  it 'respond to amount' do
    expect(@deck).to respond_to(:amount)
  end

  it 'pops off the stack if a card is dealt' do
    dealt_card = @deck.sample
    expect(@deck.deal_card).to eq(dealt_card)
  end

  it 'dealt card cant be nil' do
    expect(@deck.deal_card).not_to be_nil
  end

  it 'gets a new deck with replace_with' do
    deck_of_cards = []
    deck_of_cards.push(Card.new('Clubs', '2'))
    deck_of_cards.push(Card.new('Clubs', '3'))
    new_deck = @deck.dup
    new_deck.replace_with(deck_of_cards)

    expect(new_deck.deck).not_to eq(@deck.deck)
    expect(new_deck.suits).to eq(%w[Clubs])
    expect(new_deck.ranks).to eq(%w[2 3])
  end
end
