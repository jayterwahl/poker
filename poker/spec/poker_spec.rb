require 'game.rb'
require 'rspec'

describe Deck do

  let(:deck) {Deck.new}

  it "initializes the correct number of cards" do
    expect(deck.cards.length).to eq(52)
  end

  it "is shuffled" do
    expect(deck.cards == deck.cards.sort).to be_falsey
  end

  it "has 13 cards of each suit" do
    [:hearts, :spades, :diamonds, :clubs].each do |suit|
      expect(deck.cards.select{|card| card.suit == suit}.count).to eq(13)
    end
  end

  it "draws a card" do
    expect(deck.draw).to be_an_instance_of(Card)
    expect(deck.cards.length).to eq(51)
  end

  it "doesn't draw a card from an empty deck" do
    52.times{deck.draw}
    expect{deck.draw}.to raise_error
  end

end
