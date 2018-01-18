# frozen_string_literal: true

require_relative 'deck'
require_relative 'hand'
require_relative 'card'

# rubocop:disable all

class Blackjack
  attr_reader :deck, :player_hand, :dealer_hand, :playing
  attr_accessor :current_gamer, :result

  def initialize(suits, ranks)
    @deck = Deck.new(suits, ranks)
    @deck.shuffle
    @player_hand = nil
    @dealer_hand = nil
    @playing = false
    @current_gamer = 'Player'
    @result = ''
  end

  def deal
    unless playing
      @dealer_hand = Hand.new
      @player_hand = Hand.new

      2.times do
        dealer_hand.add_card(@deck.deal_card)
        player_hand.add_card(@deck.deal_card)
      end
      @dealer_hand.dealt_cards.first.show = false
      @playing = true
      values_of_ten = %w[10 Jack Queen King]
      player_cards = player_hand.dealt_cards

      if values_of_ten.include?(player_cards.first.rank) &&
        player_cards.last.rank == 'Ace' ||
        player_cards.first.rank == 'Ace' && values_of_ten.include?(player_cards.last.rank)
        @current_gamer = 'Dealer'
      end
    end
  end

  def hit
    if playing
      if current_gamer == 'Player'
        add_new_card player_hand
      elsif current_gamer == 'Dealer'
        add_new_card dealer_hand
      end
    end
  end

  def stand
    if playing
      if current_gamer == 'Player'
        @current_gamer = 'Dealer'
        dealer_hand.dealt_cards.first.show = true
      end

      while dealer_hand.get_value < 17
        hit
      end
    end
  end

  def show_hands
    "Player's hand: #{player_hand}\nDealer's hand: #{dealer_hand}"
  end

  def set_results
    if player_hand.get_value > 21
      @result = 'Player busted!'
    elsif dealer_hand.get_value > 21
      @result = 'Dealer busted!'
    elsif dealer_hand.get_value == player_hand.get_value
      @result = 'Tie!'
    elsif dealer_hand.get_value < player_hand.get_value
      @result = 'Player wins!'
    elsif dealer_hand.get_value > player_hand.get_value
      @result = 'Dealer wins!'
    end
  end

  private

  def add_new_card(hand)
    hand.add_card(@deck.deal_card)
    if hand.get_value > 21
      @result = "#{current_gamer} busted!"
      @playing = false
    end
  end
end
