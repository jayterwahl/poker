require 'game.rb'
require 'rspec'

describe Card do

  let(:card) {Card.new(2, :hearts)}
  let(:card1) {Card.new(2, :hearts)}
  let(:card2) {Card.new(3, :spades)}

  it "initializes with value" do
    expect(card.value).to eq(2)
  end

  it "initializes with suit" do
    expect(card.suit).to eq(:hearts)
  end

  it "returns true when two cards are equal" do
    expect(card == card1).to be_truthy
  end

  it "returns false when two cards are not equal" do
    expect(card == card2).to be_falsey
  end

  it "sorts two cards" do
    expect(card <=> card2).to eq(-1)
  end
end


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



describe Hand do

  subject(:hand) {Hand.new}
  let(:deck) {Deck.new}

  before(:each) do
    5.times{hand.cards << deck.draw}
  end


  it "stores cards in an array" do
    expect(hand.cards).to be_an_instance_of(Array)
    expect(hand.cards.sample).to be_an_instance_of(Card)
  end

  it "to_s method returns hand as a string" do
    expect(hand.to_s).to be_an_instance_of(String)
    puts hand.to_s
  end


  it "discards a specific card" do
    card1 = Card.new(2, :hearts)
    hand.cards << card1
    expect(hand.cards.include?(card1)).to eq(true)
    hand.discard(card1)
    expect(hand.cards.include?(card1)).to eq(false)
  end


end






















  #
