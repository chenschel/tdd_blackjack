# frozen_string_literal: true

require_relative 'hand'
require_relative 'card'

RSpec.describe Hand do
  before do
    @hand = Hand.new
  end

  it 'respond to dealt_cards' do
    expect(@hand).to respond_to(:dealt_cards)
  end

  describe '#add_card' do
    it 'respond to add_card' do
      expect(@hand).to respond_to(:add_card)
    end

    it 'returns the correct properties of added cards' do
      card1 = Card.new('Diamonds', 'Jack')
      card2 = Card.new('Clubs', 'Ace')
      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.dealt_cards.size).to eq(2)
      expect(@hand.dealt_cards.first.suit).to eq(card1.suit)
      expect(@hand.dealt_cards.last.suit).to eq(card2.suit)
      expect(@hand.dealt_cards.first.rank).to eq(card1.rank)
      expect(@hand.dealt_cards.last.rank).to eq(card2.rank)
    end
  end

  describe '#get_value' do
    it 'responds to get_value' do
      expect(@hand).to respond_to(:get_value)
    end

    it 'returns the correct value with no Ace' do
      card1 = Card.new('Diamonds', 'Jack')
      card2 = Card.new('Clubs', '9')

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.get_value).to eq(19)
    end

    it 'return the correct value with an Ace and a Jack' do
      card1 = Card.new('Diamonds', 'Jack')
      card2 = Card.new('Clubs', 'Ace')

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.get_value).to eq(21)
    end

    it 'return the correct value with a Five an Ace and a Jack' do
      card1 = Card.new('Diamonds', '5')
      card2 = Card.new('Clubs', 'Ace')
      card3 = Card.new('Diamonds', 'Jack')

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.get_value).to eq(16)

      @hand.add_card(card3)

      expect(@hand.get_value).to eq(16)
    end

    it 'return the correct value with a Five an Ace and a 9' do
      card1 = Card.new('Diamonds', '5')
      card2 = Card.new('Clubs', 'Ace')
      card3 = Card.new('Diamonds', '9')

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.get_value).to eq(16)

      @hand.add_card(card3)

      expect(@hand.get_value).to eq(15)
    end

    it 'return the correct value with two Aces' do
      card1 = Card.new('Diamonds', 'Ace')
      card2 = Card.new('Clubs', 'Ace')

      @hand.add_card(card1)
      expect(@hand.get_value).to eq(11)

      @hand.add_card(card2)
      expect(@hand.get_value).to eq(12)
    end
  end

  describe 'Hands output' do
    it 'returns the correct output if #show is true for all cards' do
      card1 = Card.new('Diamonds', 'Jack')
      card2 = Card.new('Clubs', 'Ace')

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.to_s).to eq('Jack of Diamonds, Ace of Clubs, Total value: 21')
    end

    it 'returns the correct output if #show is false for one card' do
      card1 = Card.new('Diamonds', 'Jack')
      card2 = Card.new('Clubs', 'Ace')
      card1.show = false

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.to_s).to eq('Ace of Clubs, Total value: 11')
    end
  end
end
