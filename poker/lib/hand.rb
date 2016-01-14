class Hand
  attr_accessor :cards

  def initialize
    @cards = []

  end

  def to_s
    cards.map{|card| card.to_s}.join("\n")
  end

  def discard(card)
    cards.delete(card)
  end
end
