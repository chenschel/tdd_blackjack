# frozen_string_literal: true

require_relative 'blackjack'
require 'pry'

RSpec.describe Blackjack do
  SUITS = %w[Diamonds Spades Hearts Clubs].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  before do
    @bj = Blackjack.new(SUITS, RANKS)
  end
  describe 'instance methods' do
    it 'responds to #player_hand' do
      expect(@bj).to respond_to(:player_hand)
    end

    it 'responds to #dealer_hand' do
      expect(@bj).to respond_to(:dealer_hand)
    end

    it 'responds to #playing' do
      expect(@bj).to respond_to(:playing)
    end

    it 'responds to #current_gamer' do
      expect(@bj).to respond_to(:current_gamer)
    end

    it 'responds to #deck' do
      expect(@bj).to respond_to(:deck)
    end

    it 'responds to #deal' do
      expect(@bj).to respond_to(:deal)
    end

    it 'responds to #hit' do
      expect(@bj).to respond_to(:hit)
    end

    it 'responds to #stand' do
      expect(@bj).to respond_to(:stand)
    end

    it 'responds to #show_hands' do
      expect(@bj).to respond_to(:show_hands)
    end

    it 'responds to #set_results' do
      expect(@bj).to respond_to(:set_results)
    end

    it 'responds to #result' do
      expect(@bj).to respond_to(:result)
    end
  end

  describe 'dealing cards' do
    before do
      @bj.deal
      @dealer_cards = @bj.dealer_hand.dealt_cards
      @player_cards = @bj.player_hand.dealt_cards
    end

    it 'returns two cards for dealer and player' do
      expect(@dealer_cards.count).to eq(2)
      expect(@player_cards.count).to eq(2)
    end

    it 'does not show the dealer\'s first card' do
      expect(@dealer_cards.first.show).to be_falsey
    end

    it 'ends the players turn if he has a blackjack' do
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', 'Ace')
      card3 = Card.new('Clubs', '3')

      card4 = Card.new('Diamonds', '10')
      card5 = Card.new('Diamonds', 'King')
      card6 = Card.new('Hearts', 'Queen')

      @bj = Blackjack.new(SUITS, RANKS)
      new_deck = [card4, card5, card2, card3, card1, card6]
      @bj.deck.replace_with(new_deck)
      @bj.deal

      expect(@bj.current_gamer).to eq('Dealer')
    end
  end

  describe 'hitting a card' do
    before do
      @bj.deal
      @dealer_cards = @bj.dealer_hand.dealt_cards
      @player_cards = @bj.player_hand.dealt_cards
    end

    it 'can hit if playing is set to true' do
      expect(@bj.playing).to be_truthy
    end

    it 'returns 2 cards for dealer, but after hit player will have 3 cards' do
      @bj.hit
      # binding.pry if @dealer_cards.count == 3
      expect(@dealer_cards.count).to eq(2)
      expect(@player_cards.count).to eq(3)
    end

    it 'correctly determines if player is busted' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', '2')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '10')
      card6 = Card.new('Hearts', 'Queen')

      @bj = Blackjack.new(SUITS, RANKS)
      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj.deck.replace_with(new_deck)
      @bj.deal
      @bj.hit

      expect(@bj.player_hand.dealt_cards.count).to eq(3)
      expect(@bj.playing).to be_falsey

      expect(@bj.result).to eq('Player busted!')
    end

    it 'correctly determines if dealer is busted' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', 'Ace')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '10')
      card6 = Card.new('Hearts', 'Queen')

      @bj = Blackjack.new(SUITS, RANKS)
      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj.deck.replace_with(new_deck)
      @bj.deal
      @bj.hit

      @bj.current_gamer = 'Dealer'
      @bj.hit

      expect(@bj.result).to eq('Dealer busted!')
    end
  end

  describe 'standing' do
    before do
      @bj = Blackjack.new(SUITS, RANKS)
    end

    it 'gamer switches to Dealer when Player stands' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', 'Ace')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '3')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj.deck.replace_with(new_deck)
      @bj.deal
      @bj.hit
      @bj.stand

      expect(@bj.current_gamer).to eq('Dealer')
    end

    it 'Dealer automatically hits if value < 17' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', 'Ace')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '3')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj.deck.replace_with(new_deck)
      @bj.deal
      expect(@bj.dealer_hand.get_value).to eq(13)

      @bj.hit # player hits
      @bj.stand
      expect(@bj.dealer_hand.dealt_cards.first.show).to be_truthy
      expect(@bj.dealer_hand.get_value).to eq(23)
    end
  end

  describe 'showings hands' do
    before do
      @bj = Blackjack.new(SUITS, RANKS)
      @bj.deal
    end

    it 'displays the gamers cards' do
      expect(@bj.show_hands).to match(/Player's hand/)
      expect(@bj.show_hands).to match(/Total value:/)
      expect(@bj.show_hands).to match(/Dealer's hand/)
      expect(@bj.show_hands).to match(/Total value:/)
    end
  end

  describe 'setting results' do
    it 'sets the correct result if player busts' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', '2')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '3')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj = Blackjack.new(SUITS, RANKS)
      @bj.deck.replace_with(new_deck)
      @bj.deal

      @bj.hit # player hits to bust

      expect(@bj.set_results).to eq('Player busted!')
    end

    it 'sets the correct result if dealer busts' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', '2')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '3')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj = Blackjack.new(SUITS, RANKS)
      @bj.deck.replace_with(new_deck)
      @bj.deal

      @bj.stand # player stands
      @bj.hit # dealer hits to bust

      expect(@bj.set_results).to eq('Dealer busted!')
    end

    it 'sets the correct result if there is a tie' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', '2')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '10')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj = Blackjack.new(SUITS, RANKS)
      @bj.deck.replace_with(new_deck)
      @bj.deal

      @bj.stand # player stands
      @bj.stand # dealer stands for tie

      expect(@bj.set_results).to eq('Tie!')
    end

    it 'sets the correct result if player wins' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '10')
      card3 = Card.new('Diamonds', 'Ace')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '10')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj = Blackjack.new(SUITS, RANKS)
      @bj.deck.replace_with(new_deck)
      @bj.deal

      @bj.hit # player hit
      @bj.stand # player stand with 21
      @bj.stand # dealer stands with 20

      expect(@bj.set_results).to eq('Player wins!')
    end

    it 'sets the correct result if dealer wins' do
      # player cards
      card1 = Card.new('Clubs', '10')
      card2 = Card.new('Hearts', '5')
      card3 = Card.new('Diamonds', '2')

      # dealer cards
      card4 = Card.new('Spades', '10')
      card5 = Card.new('Clubs', '10')
      card6 = Card.new('Hearts', 'Queen')

      new_deck = [card6, card3, card2, card5, card1, card4]
      @bj = Blackjack.new(SUITS, RANKS)
      @bj.deck.replace_with(new_deck)
      @bj.deal

      @bj.hit # player hit
      @bj.stand # player stand with 16
      @bj.stand # dealer stands with 20

      expect(@bj.set_results).to eq('Dealer wins!')
    end
  end
end
