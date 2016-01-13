require_relative 'card.rb'

class Deck

  attr_reader :cards

  def initialize

    @cards = create_deck

  end

  def create_deck
    cards = []
    [:hearts, :spades, :diamonds, :clubs].each do |suit|
      13.times{|i| cards << Card.new(i + 1, suit)}
    end
    cards.shuffle
  end

  def draw
    raise "Empty Deck" if cards.length == 0
    cards.pop
  end

end
