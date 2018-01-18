# frozen_string_literal: true

require_relative 'card'

RSpec.describe Card do
  before do
    suit = 'Diamonds'
    rank = '8'

    @card = Card.new(suit, rank)
  end

  it 'responds to suit' do
    expect(@card).to respond_to(:suit)
  end

  it 'responds to rank' do
    expect(@card).to respond_to(:rank)
  end

  it 'responds to show' do
    expect(@card).to respond_to(:show)
  end

  it "'show' returns 'true'" do
    expect(@card.show).to be_truthy
  end

  it "'rank' returns '8'" do
    expect(@card.rank).to eq('8')
  end

  it "'suit' returns 'Diamonds'" do
    expect(@card.suit).to eq('Diamonds')
  end

  it 'outputs rank and suit of card if show is true' do
    expect(@card.to_s).to eq("#{@card.rank} of #{@card.suit}")
  end

  it 'does not outout anythig if show is false' do
    @card.show = false
    expect(@card.to_s).to eq('')
  end
end
